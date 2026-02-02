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
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$$RepairShopResponseDtoImplToJson(
        _$RepairShopResponseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'profileImageUrl': instance.profileImageUrl,
    };
