import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/models/auth_dtos.dart';
import '../../features/auth/presentation/providers/auth_notifier.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _authLocalDataSource;
  final Ref _ref;
  final String _baseUrl;

  /// Completer to prevent concurrent token refresh calls
  Completer<bool>? _refreshCompleter;

  AuthInterceptor(this._authLocalDataSource, this._ref, this._baseUrl);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add Authorization header if not already present
    if (!options.headers.containsKey('carai-token')) {
      final token = _authLocalDataSource.getAccessToken();
      if (token != null) {
        options.headers['carai-token'] = token;
        debugPrint('🔐 [AuthInterceptor] Added AccessToken to ${options.uri}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      if (data['success'] == false && data['error'] is Map<String, dynamic>) {
        final errorCode = (data['error'] as Map<String, dynamic>)['code'];
        if (errorCode == 12002) {
          debugPrint(
            '⚠️ [AuthInterceptor] Token expired (12002) detected, attempting refresh...',
          );

          final refreshed = await _tryRefreshToken();
          if (refreshed) {
            // Retry original request with new token
            try {
              final retryResponse = await _retryRequest(
                response.requestOptions,
              );
              return handler.resolve(retryResponse);
            } catch (e) {
              debugPrint(
                '❌ [AuthInterceptor] Retry failed after token refresh: $e',
              );
              return handler.next(response);
            }
          } else {
            debugPrint(
              '❌ [AuthInterceptor] Token refresh failed, logging out...',
            );
            _ref.read(authNotifierProvider.notifier).logout();
            return handler.next(response);
          }
        }
      }
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      debugPrint(
        '⚠️ [AuthInterceptor] 401 Unauthorized: ${err.requestOptions.uri}',
      );
      // Automatically logout on 401 to trigger redirect to login
      _ref.read(authNotifierProvider.notifier).logout();
    }
    handler.next(err);
  }

  /// Attempts to refresh the token. Uses a Completer to prevent concurrent
  /// refresh calls — if a refresh is already in progress, subsequent callers
  /// will await the same result.
  Future<bool> _tryRefreshToken() async {
    // If a refresh is already in progress, wait for it
    if (_refreshCompleter != null) {
      debugPrint(
        '🔄 [AuthInterceptor] Refresh already in progress, waiting...',
      );
      return _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<bool>();

    try {
      final refreshToken = _authLocalDataSource.getRefreshToken();
      if (refreshToken == null) {
        debugPrint('❌ [AuthInterceptor] No refresh token found');
        _refreshCompleter!.complete(false);
        return false;
      }

      // Use a separate Dio instance without interceptors to avoid infinite loop
      final plainDio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      debugPrint('🔄 [AuthInterceptor] Calling /auth/token/refresh...');
      final response = await plainDio.post(
        '/auth/token/refresh',
        data: RefreshTokenRequest(refreshToken: refreshToken).toJson(),
      );

      if (response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        if (data['success'] == true && data['result'] != null) {
          final tokenResponse = RefreshTokenResponse.fromJson(
            data['result'] as Map<String, dynamic>,
          );
          await _authLocalDataSource.saveTokens(
            accessToken: tokenResponse.accessToken,
            refreshToken: tokenResponse.refreshToken,
          );
          debugPrint('✅ [AuthInterceptor] Token refreshed successfully');
          _refreshCompleter!.complete(true);
          return true;
        }
      }

      debugPrint('❌ [AuthInterceptor] Token refresh response was not successful');
      _refreshCompleter!.complete(false);
      return false;
    } catch (e) {
      debugPrint('❌ [AuthInterceptor] Token refresh error: $e');
      _refreshCompleter!.complete(false);
      return false;
    } finally {
      _refreshCompleter = null;
    }
  }

  /// Retries the original request with the newly refreshed token.
  Future<Response> _retryRequest(RequestOptions requestOptions) {
    final newToken = _authLocalDataSource.getAccessToken();
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'carai-token': newToken,
      },
    );

    // Use a separate Dio instance to avoid triggering interceptors again
    final plainDio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      ),
    );

    debugPrint(
      '🔄 [AuthInterceptor] Retrying request: ${requestOptions.method} ${requestOptions.uri}',
    );

    return plainDio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
