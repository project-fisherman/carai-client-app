import 'package:freezed_annotation/freezed_annotation.dart';

part 'mechanic_dashboard_dtos.freezed.dart';
part 'mechanic_dashboard_dtos.g.dart';

@freezed
class CreateShopRequestDto with _$CreateShopRequestDto {
  const factory CreateShopRequestDto({
    required String name,
    required String address,
    required String phoneNumber,
    String? profileImageUrl,
  }) = _CreateShopRequestDto;

  factory CreateShopRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateShopRequestDtoFromJson(json);
}

@freezed
class RepairShopResponseDto with _$RepairShopResponseDto {
  const factory RepairShopResponseDto({
    required String id,
    required String name,
    required String address,
    required String phoneNumber,
    String? profileImageUrl,
  }) = _RepairShopResponseDto;

  factory RepairShopResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RepairShopResponseDtoFromJson(json);
}
