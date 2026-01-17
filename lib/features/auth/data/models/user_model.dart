import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String phoneNumber,
    required String name,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  User toEntity() => User(id: id, phoneNumber: phoneNumber, name: name);
  
  factory UserModel.fromEntity(User user) => UserModel(
    id: user.id,
    phoneNumber: user.phoneNumber,
    name: user.name,
  );
}
