// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_team_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepairShopUserResponseImpl _$$RepairShopUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RepairShopUserResponseImpl(
      id: (json['id'] as num).toInt(),
      repairShopId: (json['repairShopId'] as num).toInt(),
      userId: json['userId'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$RepairShopUserResponseImplToJson(
        _$RepairShopUserResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repairShopId': instance.repairShopId,
      'userId': instance.userId,
      'role': instance.role,
    };

_$ChangeRoleRequestImpl _$$ChangeRoleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangeRoleRequestImpl(
      targetUserId: json['targetUserId'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$ChangeRoleRequestImplToJson(
        _$ChangeRoleRequestImpl instance) =>
    <String, dynamic>{
      'targetUserId': instance.targetUserId,
      'role': instance.role,
    };

_$KickUserRequestImpl _$$KickUserRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$KickUserRequestImpl(
      targetUserId: json['targetUserId'] as String,
    );

Map<String, dynamic> _$$KickUserRequestImplToJson(
        _$KickUserRequestImpl instance) =>
    <String, dynamic>{
      'targetUserId': instance.targetUserId,
    };
