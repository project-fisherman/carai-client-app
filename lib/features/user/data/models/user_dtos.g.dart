// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateMeRequestImpl _$$UpdateMeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateMeRequestImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UpdateMeRequestImplToJson(
        _$UpdateMeRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$MeResponseImpl _$$MeResponseImplFromJson(Map<String, dynamic> json) =>
    _$MeResponseImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$MeResponseImplToJson(_$MeResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };
