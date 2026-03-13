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
    @Default(0) int checklistCount,
    String? profileImageUrl,
  }) = _RepairShopResponseDto;

  factory RepairShopResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RepairShopResponseDtoFromJson(json);
}

enum RepairShopRole {
  OWNER,
  MANAGER,
  STAFF,
  INVITED;

  bool get isOwnerOrManager =>
      this == RepairShopRole.OWNER || this == RepairShopRole.MANAGER;
}

@freezed
class RepairShopUserResponseDto with _$RepairShopUserResponseDto {
  const factory RepairShopUserResponseDto({
    required String id,
    required String repairShopId,
    required String userId,
    required RepairShopRole role,
  }) = _RepairShopUserResponseDto;

  factory RepairShopUserResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RepairShopUserResponseDtoFromJson(json);
}

@freezed
class InviteByPhoneRequestDto with _$InviteByPhoneRequestDto {
  const factory InviteByPhoneRequestDto({
    required String phoneNumber,
    String? baseUrl,
  }) = _InviteByPhoneRequestDto;

  factory InviteByPhoneRequestDto.fromJson(Map<String, dynamic> json) =>
      _$InviteByPhoneRequestDtoFromJson(json);
}

@freezed
class InviteByPhoneResponseDto with _$InviteByPhoneResponseDto {
  const factory InviteByPhoneResponseDto({
    required bool sent,
    required String inviteToken,
    required String expiresAt,
  }) = _InviteByPhoneResponseDto;

  factory InviteByPhoneResponseDto.fromJson(Map<String, dynamic> json) =>
      _$InviteByPhoneResponseDtoFromJson(json);
}

@freezed
class AcceptPhoneInviteRequestDto with _$AcceptPhoneInviteRequestDto {
  const factory AcceptPhoneInviteRequestDto({
    required String token,
  }) = _AcceptPhoneInviteRequestDto;

  factory AcceptPhoneInviteRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AcceptPhoneInviteRequestDtoFromJson(json);
}

@freezed
class InvitePendingResponseDto with _$InvitePendingResponseDto {
  const factory InvitePendingResponseDto({
    required bool pending,
  }) = _InvitePendingResponseDto;

  factory InvitePendingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$InvitePendingResponseDtoFromJson(json);
}
