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
}

@freezed
class RepairShopUser with _$RepairShopUser {
  const factory RepairShopUser({
    required int id,
    required int repairShopId,
    required String userId,
    required String name,
    required RepairShopRole role,
    String? profileImageUrl,
  }) = _RepairShopUser;
}
