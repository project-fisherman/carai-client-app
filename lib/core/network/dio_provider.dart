import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../analytics/analytics_service.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../constants/app_constants.dart';
import '../utils/global_keys.dart';
import 'auth_interceptor.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.apiBaseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    ),
  );

  dio.interceptors.add(
    AuthInterceptor(
      ref.watch(authLocalDataSourceProvider),
      ref,
      AppConstants.apiBaseUrl,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint(
          '🌐 [DIO] Request: ${options.method} ${options.uri} Headers: ${options.headers}',
        );
        if (options.data != null) {
          debugPrint('🌐 [DIO] Body: ${options.data}');
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint(
          '✅ [DIO] Response [${response.statusCode}] ${response.requestOptions.method} ${response.requestOptions.uri}: ${response.data}',
        );

        if (response.data is Map<String, dynamic>) {
          final data = response.data as Map<String, dynamic>;
          if (data['success'] == false && data['error'] != null) {
            final error = data['error'];

            // 토큰 만료 에러(12002)는 AuthInterceptor에서 자동 갱신 처리하므로 스킵
            final errorCode =
                error is Map<String, dynamic> ? error['code'] : null;
            if (errorCode == 12002) {
              return handler.next(response);
            }

            String? errorMessage;
            if (error is Map<String, dynamic>) {
              errorMessage = error['message'] as String?;
            }

            // Log Analytics Event (Triggers Cloud Function)
            // Note: We don't await here to not block the response, but we trigger it
            AnalyticsService.logApiError(
              errorType: 'Success False',
              method: response.requestOptions.method,
              uri: response.requestOptions.uri.toString(),
              message: errorMessage,
              responseData: response.data,
            );

            if (errorMessage != null && errorMessage.isNotEmpty) {
              // Remove existing snackbars to avoid queueing
              scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
              scaffoldMessengerKey.currentState?.showSnackBar(
                SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
              );
            }
          }
        }

        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        debugPrint(
          '❌ [DIO] Error: ${e.requestOptions.method} ${e.requestOptions.uri} - ${e.message}',
        );
        if (e.response != null) {
          debugPrint(
            '❌ [DIO] Error Response: ${e.requestOptions.method} ${e.requestOptions.uri} - ${e.response?.data}',
          );
        }

        // Log Analytics Event (Triggers Cloud Function)
        AnalyticsService.logApiError(
          errorType: 'DioException',
          method: e.requestOptions.method,
          uri: e.requestOptions.uri.toString(),
          message: e.message,
          responseData: e.response?.data,
        );

        // Show global error snackbar for network/server errors
        scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Text('알 수 없는 오류가 발생했습니다.'),
            backgroundColor: Colors.red,
          ),
        );

        return handler.next(e);
      },
    ),
  );

  return dio;
}
