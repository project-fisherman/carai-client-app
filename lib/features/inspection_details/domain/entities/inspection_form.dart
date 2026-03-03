import 'package:freezed_annotation/freezed_annotation.dart';
import 'inspection_item.dart';

part 'inspection_form.freezed.dart';
part 'inspection_form.g.dart';

@freezed
class InspectionForm with _$InspectionForm {
  const factory InspectionForm({
    required InspectionMeta meta,
    required List<InspectionHeaderField> header,
    required List<InspectionGroup> groups,
  }) = _InspectionForm;

  factory InspectionForm.fromJson(Map<String, dynamic> json) =>
      _$InspectionFormFromJson(json);
}

@freezed
class InspectionMeta with _$InspectionMeta {
  const factory InspectionMeta({required String id, required String status}) =
      _InspectionMeta;

  factory InspectionMeta.fromJson(Map<String, dynamic> json) =>
      _$InspectionMetaFromJson(json);
}

@freezed
class InspectionHeaderField with _$InspectionHeaderField {
  const factory InspectionHeaderField({
    required String id,
    required String label,
    required String type, // text, number, date
  }) = _InspectionHeaderField;

  factory InspectionHeaderField.fromJson(Map<String, dynamic> json) =>
      _$InspectionHeaderFieldFromJson(json);
}

@freezed
class InspectionGroup with _$InspectionGroup {
  const factory InspectionGroup({
    @JsonKey(name: 'group_seq') required int groupSeq,
    @JsonKey(name: 'group_label') required String groupLabel,
    required List<InspectionItem> items,
  }) = _InspectionGroup;

  factory InspectionGroup.fromJson(Map<String, dynamic> json) =>
      _$InspectionGroupFromJson(json);
}
