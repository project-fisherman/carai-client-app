import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/repair_shop_user.dart';

part 'manage_workshop_dtos.freezed.dart';
part 'manage_workshop_dtos.g.dart';

@freezed
class RepairShopUserResponse with _$RepairShopUserResponse {
  const factory RepairShopUserResponse({
    required int id,
    required int repairShopId,
    required String userId,
    required String role,
  }) = _RepairShopUserResponse;

  const RepairShopUserResponse._();

  factory RepairShopUserResponse.fromJson(Map<String, dynamic> json) {
    // Server sends userId as int (Long), but we need String
    return RepairShopUserResponse(
      id: json['id'] as int,
      repairShopId: json['repairShopId'] as int,
      userId: json['userId'].toString(), // Convert int to String
      role: json['role'] as String,
    );
  }

  RepairShopUser toDomain({String placeholderName = 'Unknown User'}) {
    return RepairShopUser(
      id: id,
      repairShopId: repairShopId,
      userId: userId,
      name: placeholderName, // The server DTO doesn't have name :(
      role: RepairShopRole.values.firstWhere(
        (e) => e.name.toUpperCase() == role.toUpperCase(),
        orElse: () => RepairShopRole.staff,
      ),
    );
  }
}

@freezed
class ChangeRoleRequest with _$ChangeRoleRequest {
  const factory ChangeRoleRequest({
    required String targetUserId,
    required String role,
  }) = _ChangeRoleRequest;

  const ChangeRoleRequest._();

  factory ChangeRoleRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeRoleRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    // Server expects int (Long), but we use String
    return {'targetUserId': int.parse(targetUserId), 'role': role};
  }
}

@freezed
class KickUserRequest with _$KickUserRequest {
  const factory KickUserRequest({required String targetUserId}) =
      _KickUserRequest;

  const KickUserRequest._();

  factory KickUserRequest.fromJson(Map<String, dynamic> json) =>
      _$KickUserRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    // Server expects int (Long), but we use String
    return {'targetUserId': int.parse(targetUserId)};
  }
}
