import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_shop_user.freezed.dart';

enum RepairShopRole {
  @JsonValue('OWNER')
  owner,
  @JsonValue('MANAGER')
  manager,
  @JsonValue('STAFF')
  staff,
  @JsonValue('INVITED')
  invited;

  bool get isManagerOrHigher =>
      this == RepairShopRole.owner || this == RepairShopRole.manager;

  String get label {
    switch (this) {
      case RepairShopRole.owner:
        return '대표';
      case RepairShopRole.manager:
        return '관리자';
      case RepairShopRole.staff:
        return '직원';
      case RepairShopRole.invited:
        return '초대됨';
    }
  }
}

@freezed
class RepairShopUser with _$RepairShopUser {
  const factory RepairShopUser({
    required String id,
    required String repairShopId,
    required String userId,
    required String name,
    required RepairShopRole role,
    String? profileImageUrl,
  }) = _RepairShopUser;
}
