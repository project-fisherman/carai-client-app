import 'package:freezed_annotation/freezed_annotation.dart';
import 'safety_checklist_dtos.dart';

part 'repair_job_dtos.freezed.dart';
part 'repair_job_dtos.g.dart';

@freezed
class RepairJobResponseDto with _$RepairJobResponseDto {
  const factory RepairJobResponseDto({
    required String id,
    required String repairShopId,
    required String assigneeUserId,
    String? checklistId,
    required String status,
    String? description,
  }) = _RepairJobResponseDto;

  factory RepairJobResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RepairJobResponseDtoFromJson(json);
}

@freezed
class MyJobsPageResponseDto with _$MyJobsPageResponseDto {
  const factory MyJobsPageResponseDto({
    @Default([]) List<RepairJobResponseDto> jobs,
    String? nextCursorUpdatedAt,
    String? nextCursorId,
    @Default(false) bool hasNext,
  }) = _MyJobsPageResponseDto;

  factory MyJobsPageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MyJobsPageResponseDtoFromJson(json);
}

@freezed
class RepairJobDetailResponseDto with _$RepairJobDetailResponseDto {
  const factory RepairJobDetailResponseDto({
    required RepairJobResponseDto job,
    SafetyChecklistResponseDto? checklist,
    String? customerName,
    String? customerPhoneNumber,
    String? carNumber,
    int? mileage,
    String? description,
  }) = _RepairJobDetailResponseDto;

  factory RepairJobDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RepairJobDetailResponseDtoFromJson(json);
}
