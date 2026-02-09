import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_shop.freezed.dart';
part 'repair_shop.g.dart';

@freezed
class RepairShop with _$RepairShop {
  const factory RepairShop({
    required int id,
    required String name,
    required String address,
    required String phoneNumber,
    required int checklistCount,
    String? profileImageUrl,
  }) = _RepairShop;

  factory RepairShop.fromJson(Map<String, dynamic> json) =>
      _$RepairShopFromJson(json);
}
