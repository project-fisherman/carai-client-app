import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_job.freezed.dart';

@freezed
class RepairJob with _$RepairJob {
  const factory RepairJob({
    required int id,
    required int repairShopId,
    required int assigneeUserId,
    required String status,
    String? description,
  }) = _RepairJob;
}
