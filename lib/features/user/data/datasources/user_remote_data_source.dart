import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../models/user_dtos.dart';

part 'user_remote_data_source.g.dart';

@riverpod
UserRemoteDataSource userRemoteDataSource(UserRemoteDataSourceRef ref) {
  return UserRemoteDataSource(ref.watch(dioProvider));
}

class UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSource(this._dio);

  Future<MeResponse> getMe() async {
    final response = await _dio.get('/users/me');
    return MeResponse.fromJson(response.data['result']);
  }

  Future<MeResponse> updateMe({required String name}) async {
    final response = await _dio.patch(
      '/users/me',
      data: UpdateMeRequest(name: name).toJson(),
    );
    return MeResponse.fromJson(response.data['result']);
  }
}
