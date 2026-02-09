// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mechanic_dashboard_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateShopRequestDtoImpl _$$CreateShopRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateShopRequestDtoImpl(
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$$CreateShopRequestDtoImplToJson(
        _$CreateShopRequestDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'profileImageUrl': instance.profileImageUrl,
    };

_$RepairShopResponseDtoImpl _$$RepairShopResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RepairShopResponseDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      checklistCount: (json['checklistCount'] as num).toInt(),
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$$RepairShopResponseDtoImplToJson(
        _$RepairShopResponseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'checklistCount': instance.checklistCount,
      'profileImageUrl': instance.profileImageUrl,
    };

_$RepairShopUserResponseDtoImpl _$$RepairShopUserResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RepairShopUserResponseDtoImpl(
      id: json['id'] as String,
      repairShopId: json['repairShopId'] as String,
      userId: json['userId'] as String,
      role: $enumDecode(_$RepairShopRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$$RepairShopUserResponseDtoImplToJson(
        _$RepairShopUserResponseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repairShopId': instance.repairShopId,
      'userId': instance.userId,
      'role': _$RepairShopRoleEnumMap[instance.role]!,
    };

const _$RepairShopRoleEnumMap = {
  RepairShopRole.OWNER: 'OWNER',
  RepairShopRole.MANAGER: 'MANAGER',
  RepairShopRole.STAFF: 'STAFF',
  RepairShopRole.INVITED: 'INVITED',
};
