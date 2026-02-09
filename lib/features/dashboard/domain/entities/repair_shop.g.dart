// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepairShopImpl _$$RepairShopImplFromJson(Map<String, dynamic> json) =>
    _$RepairShopImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$$RepairShopImplToJson(_$RepairShopImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'profileImageUrl': instance.profileImageUrl,
    };
