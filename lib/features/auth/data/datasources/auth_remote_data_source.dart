import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../models/user_model.dart';

part 'auth_remote_data_source.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSource(ref.watch(dioProvider));
}

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  Future<UserModel> login({required String phoneNumber, required String password}) async {
    // TODO: Replace with actual API endpoint
    // For now, mocking the response
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    
    // In a real scenario:
    // final response = await _dio.post('/auth/login', data: {'phone': phoneNumber, 'password': password});
    // return UserModel.fromJson(response.data);

    // Mock response
    return UserModel(
      id: 'mock_id_123',
      phoneNumber: phoneNumber,
      token: 'mock_jwt_token',
    );
  }
}
