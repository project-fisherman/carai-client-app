import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/repair_job.dart';

abstract class RepairJobRepository {
  /// 내 작업 목록 조회
  Future<Either<Failure, List<RepairJob>>> getMyJobs({String? status});
}
