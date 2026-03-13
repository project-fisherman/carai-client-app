import 'package:freezed_annotation/freezed_annotation.dart';
import 'repair_job.dart';

part 'repair_job_page.freezed.dart';

@freezed
class RepairJobPage with _$RepairJobPage {
  const factory RepairJobPage({
    required List<RepairJob> jobs,
    String? nextCursorUpdatedAt,
    String? nextCursorId,
    required bool hasNext,
  }) = _RepairJobPage;
}
