import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';

import '../models/auth_dtos.dart';

part 'auth_remote_data_source.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSource(ref.watch(dioProvider));
}

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  Future<LoginResponse> login({required LoginRequest request}) async {
    final response = await _dio.post('/auth/login', data: request.toJson());
    return LoginResponse.fromJson(response.data['result']);
  }

  Future<SendSmsCodeResponse> sendSmsCode({
    required SendSmsCodeRequest request,
  }) async {
    final response = await _dio.post(
      '/auth/sms/send/code',
      data: request.toJson(),
    );
    return SendSmsCodeResponse.fromJson(response.data['result']);
  }

  Future<VerifySmsCodeResponse> verifySmsCode({
    required VerifySmsCodeRequest request,
  }) async {
    final response = await _dio.post(
      '/auth/sms/verify',
      data: request.toJson(),
    );
    return VerifySmsCodeResponse.fromJson(response.data['result']);
  }

  Future<SignupResponse> signup({required SignupRequest request}) async {
    final response = await _dio.post('/auth/signup', data: request.toJson());
    return SignupResponse.fromJson(response.data['result']);
  }

  Future<RefreshTokenResponse> refreshToken({
    required String refreshToken,
  }) async {
    final response = await _dio.post(
      '/auth/token/refresh',
      data: RefreshTokenRequest(refreshToken: refreshToken).toJson(),
    );
    return RefreshTokenResponse.fromJson(response.data['result']);
  }
}
