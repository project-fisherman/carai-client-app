import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../utils/global_keys.dart';
import 'auth_interceptor.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://34.64.161.110:8080/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(AuthInterceptor(ref.watch(authLocalDataSourceProvider)));

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
            if (error is Map<String, dynamic>) {
              final message = error['message'] as String?;
              if (message != null && message.isNotEmpty) {
                // Remove existing snackbars to avoid queueing
                scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
                scaffoldMessengerKey.currentState?.showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                );
              }
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
        return handler.next(e);
      },
    ),
  );

  return dio;
}
