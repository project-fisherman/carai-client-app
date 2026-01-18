import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        print('🌐 [DIO] Request: ${options.method} ${options.uri}');
        if (options.data != null) {
          print('🌐 [DIO] Body: ${options.data}');
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('✅ [DIO] Response [${response.statusCode}]: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        print('❌ [DIO] Error: ${e.message}');
        if (e.response != null) {
          print('❌ [DIO] Error Response: ${e.response?.data}');
        }
        return handler.next(e);
      },
    ),
  );

  return dio;
}
