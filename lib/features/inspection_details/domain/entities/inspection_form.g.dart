// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InspectionFormImpl _$$InspectionFormImplFromJson(Map<String, dynamic> json) =>
    _$InspectionFormImpl(
      meta: InspectionMeta.fromJson(json['meta'] as Map<String, dynamic>),
      header: (json['header'] as List<dynamic>)
          .map((e) => InspectionHeaderField.fromJson(e as Map<String, dynamic>))
          .toList(),
      groups: (json['groups'] as List<dynamic>)
          .map((e) => InspectionGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InspectionFormImplToJson(
        _$InspectionFormImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'header': instance.header,
      'groups': instance.groups,
    };

_$InspectionMetaImpl _$$InspectionMetaImplFromJson(Map<String, dynamic> json) =>
    _$InspectionMetaImpl(
      id: json['id'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$InspectionMetaImplToJson(
        _$InspectionMetaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
    };

_$InspectionHeaderFieldImpl _$$InspectionHeaderFieldImplFromJson(
        Map<String, dynamic> json) =>
    _$InspectionHeaderFieldImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$InspectionHeaderFieldImplToJson(
        _$InspectionHeaderFieldImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': instance.type,
    };

_$InspectionGroupImpl _$$InspectionGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$InspectionGroupImpl(
      groupSeq: (json['group_seq'] as num).toInt(),
      groupLabel: json['group_label'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => InspectionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InspectionGroupImplToJson(
        _$InspectionGroupImpl instance) =>
    <String, dynamic>{
      'group_seq': instance.groupSeq,
      'group_label': instance.groupLabel,
      'items': instance.items,
    };
