import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/repair_job.dart';
import '../entities/repair_job_page.dart';

abstract class RepairJobRepository {
  /// 내 작업 목록 조회
  Future<Either<Failure, RepairJobPage>> getMyJobs({
    String? status,
    String? cursorUpdatedAt,
    String? cursorId,
    int size = 20,
  });

  /// 작업 시작
  Future<Either<Failure, void>> startJob({required String jobId, required String checklistId});
}
