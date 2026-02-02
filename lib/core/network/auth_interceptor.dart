import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _authLocalDataSource;

  AuthInterceptor(this._authLocalDataSource);

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
      // Potential TODO: Handle automatic token refresh here if desired,
      // but for now we are relying on foreground refresh or manual login.
      // If we want 401 retry, we would need to depend on AuthRepository here which might cause circular dependency
      // unless we break it differently.
      // Given the requirement is "foreground token refresh", we stick to that first.
    }
    handler.next(err);
  }
}
