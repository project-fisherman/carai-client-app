import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_checklist_dtos.freezed.dart';
part 'safety_checklist_dtos.g.dart';

@freezed
class SafetyChecklistResponseDto with _$SafetyChecklistResponseDto {
  const factory SafetyChecklistResponseDto({
    required int id,
    required String name,
    required String imageUrl,
    required String jsonUrl,
    required String htmlUrl,
    required bool isPreset,
    String? createdAt,
    String? updatedAt,
  }) = _SafetyChecklistResponseDto;

  factory SafetyChecklistResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SafetyChecklistResponseDtoFromJson(json);
}
