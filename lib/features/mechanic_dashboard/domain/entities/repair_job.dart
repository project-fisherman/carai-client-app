import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_job.freezed.dart';

@freezed
class RepairJob with _$RepairJob {
  const factory RepairJob({
    required String id,
    required String repairShopId,
    required String assigneeUserId,
    required String status,
    String? description,
  }) = _RepairJob;
}
