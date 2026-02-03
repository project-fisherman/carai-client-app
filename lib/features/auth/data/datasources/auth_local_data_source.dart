import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user_model.dart';

part 'auth_local_data_source.g.dart';

@riverpod
AuthLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) {
  return AuthLocalDataSource(
    Hive.box('authBox'),
  ); // Box should be opened before accessing
}

class AuthLocalDataSource {
  final Box _box;
  static const String _userKey = 'user_data';

  AuthLocalDataSource(this._box);

  Future<void> saveUser(UserModel user) async {
    await _box.put(_userKey, jsonEncode(user.toJson()));
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _box.put('access_token', accessToken);
    await _box.put('refresh_token', refreshToken);
  }

  String? getAccessToken() {
    return _box.get('access_token');
  }

  String? getRefreshToken() {
    return _box.get('refresh_token');
  }

  Future<void> clearTokens() async {
    await _box.delete('access_token');
    await _box.delete('refresh_token');
  }

  Future<UserModel?> getUser() async {
    final userString = _box.get(_userKey);
    if (userString != null) {
      return UserModel.fromJson(jsonDecode(userString));
    }
    return null;
  }

  Future<void> deleteUser() async {
    await _box.delete(_userKey);
  }
}
