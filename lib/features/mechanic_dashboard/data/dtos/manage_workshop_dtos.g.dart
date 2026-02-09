// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_workshop_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
