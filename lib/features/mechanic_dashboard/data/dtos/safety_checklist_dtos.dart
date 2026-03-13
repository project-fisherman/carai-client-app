import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_checklist_dtos.freezed.dart';
part 'safety_checklist_dtos.g.dart';

@freezed
class SafetyChecklistResponseDto with _$SafetyChecklistResponseDto {
  const factory SafetyChecklistResponseDto({
    required String id,
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

@freezed
class PagedChecklistResponseDto with _$PagedChecklistResponseDto {
  const factory PagedChecklistResponseDto({
    @Default([]) List<SafetyChecklistResponseDto> items,
    String? nextLastId,
    @Default(false) bool hasMore,
  }) = _PagedChecklistResponseDto;

  factory PagedChecklistResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PagedChecklistResponseDtoFromJson(json);
}
