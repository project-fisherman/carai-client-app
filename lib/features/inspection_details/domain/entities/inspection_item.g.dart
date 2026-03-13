// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InspectionItemImpl _$$InspectionItemImplFromJson(Map<String, dynamic> json) =>
    _$InspectionItemImpl(
      seqNo: (json['seq_no'] as num).toInt(),
      itemName: json['item_name'] as String,
      method: json['method'] as String,
      widgetType: $enumDecodeNullable(
          _$InspectionItemWidgetTypeEnumMap, json['widget_type_id'],
          unknownValue: InspectionItemWidgetType.goodWarningCheck),
    );

Map<String, dynamic> _$$InspectionItemImplToJson(
        _$InspectionItemImpl instance) =>
    <String, dynamic>{
      'seq_no': instance.seqNo,
      'item_name': instance.itemName,
      'method': instance.method,
      'widget_type_id': _$InspectionItemWidgetTypeEnumMap[instance.widgetType],
    };

const _$InspectionItemWidgetTypeEnumMap = {
  InspectionItemWidgetType.goodWarningCheck: 1,
  InspectionItemWidgetType.frontAndRearMeasurementCheck: 2,
};
