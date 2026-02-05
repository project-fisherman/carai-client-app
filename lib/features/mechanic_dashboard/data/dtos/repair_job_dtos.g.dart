// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_job_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepairJobResponseDtoImpl _$$RepairJobResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RepairJobResponseDtoImpl(
      id: (json['id'] as num).toInt(),
      repairShopId: (json['repairShopId'] as num).toInt(),
      assigneeUserId: (json['assigneeUserId'] as num).toInt(),
      status: json['status'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$RepairJobResponseDtoImplToJson(
        _$RepairJobResponseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repairShopId': instance.repairShopId,
      'assigneeUserId': instance.assigneeUserId,
      'status': instance.status,
      'description': instance.description,
    };
