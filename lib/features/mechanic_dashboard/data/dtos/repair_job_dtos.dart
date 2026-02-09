import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_job_dtos.freezed.dart';
part 'repair_job_dtos.g.dart';

@freezed
class RepairJobResponseDto with _$RepairJobResponseDto {
  const factory RepairJobResponseDto({
    required String id,
    required String repairShopId,
    required String assigneeUserId,
    required String status,
    String? description,
  }) = _RepairJobResponseDto;

  factory RepairJobResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RepairJobResponseDtoFromJson(json);
}
