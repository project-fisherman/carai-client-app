import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/network/dio_provider.dart';
import '../models/auth_dtos.dart';
import '../models/user_model.dart';

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
    return LoginResponse.fromJson(response.data['data']);
  }

  Future<SendSmsCodeResponse> sendSmsCode({required SendSmsCodeRequest request}) async {
    final response = await _dio.post('/auth/sms/send/code', data: request.toJson());
    return SendSmsCodeResponse.fromJson(response.data['data']);
  }

  Future<VerifySmsCodeResponse> verifySmsCode({required VerifySmsCodeRequest request}) async {
    final response = await _dio.post('/auth/sms/verify', data: request.toJson());
    return VerifySmsCodeResponse.fromJson(response.data['data']); // Assuming 'data' contains the boolean/token? Check server.
    // Server says: ApiResponse<Void> or VerifySmsCodeResponse?
    // AuthController.kt: verifySms returns ApiResponse<Void> with true/false? No, ApiResponse(true) 
    // Wait, let's re-read AuthController.kt
  }
  
  Future<SignupResponse> signup({required SignupRequest request}) async {
    final response = await _dio.post('/auth/signup', data: request.toJson());
    return SignupResponse.fromJson(response.data['data']);
  }
}
