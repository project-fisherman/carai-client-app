import 'package:freezed_annotation/freezed_annotation.dart';

part 'inspection_item.freezed.dart';
part 'inspection_item.g.dart';

@freezed
class InspectionItem with _$InspectionItem {
  const factory InspectionItem({
    @JsonKey(name: 'seq_no') required int seqNo,
    @JsonKey(name: 'item_name') required String itemName,
    required String method,
    @JsonKey(name: 'widget_type') required InspectionItemWidgetType widgetType,
  }) = _InspectionItem;

  factory InspectionItem.fromJson(Map<String, dynamic> json) =>
      _$InspectionItemFromJson(json);
}

enum InspectionItemWidgetType {
  @JsonValue('good_warning_check')
  goodWarningCheck,
  @JsonValue('front_and_rear_measurement_check')
  frontAndRearMeasurementCheck,
}
