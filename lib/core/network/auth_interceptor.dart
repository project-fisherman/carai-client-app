import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/presentation/providers/auth_notifier.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _authLocalDataSource;
  final Ref _ref;

  AuthInterceptor(this._authLocalDataSource, this._ref);

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
}
