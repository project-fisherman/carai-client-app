import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../data_sources/repair_job_api.dart';
import '../../domain/entities/repair_job.dart';
import '../../domain/entities/repair_job_page.dart';
import '../../domain/repositories/repair_job_repository.dart';

part 'repair_job_repository_impl.g.dart';

@riverpod
RepairJobRepository repairJobRepository(RepairJobRepositoryRef ref) {
  return RepairJobRepositoryImpl(ref.watch(repairJobApiProvider));
}

class RepairJobRepositoryImpl implements RepairJobRepository {
  final RepairJobApi _api;

  RepairJobRepositoryImpl(this._api);

  @override
  Future<Either<Failure, RepairJobPage>> getMyJobs({
    String? status,
    String? cursorUpdatedAt,
    String? cursorId,
    int size = 20,
  }) async {
    try {
      final dto = await _api.getMyJobs(
        status: status,
        cursorUpdatedAt: cursorUpdatedAt,
        cursorId: cursorId,
        size: size,
      );
      final jobs = dto.jobs
          .map(
            (jobDto) => RepairJob(
              id: jobDto.id,
              repairShopId: jobDto.repairShopId,
              assigneeUserId: jobDto.assigneeUserId,
              checklistId: jobDto.checklistId,
              status: jobDto.status,
              description: jobDto.description,
            ),
          )
          .toList();
      final page = RepairJobPage(
        jobs: jobs,
        nextCursorUpdatedAt: dto.nextCursorUpdatedAt,
        nextCursorId: dto.nextCursorId,
        hasNext: dto.hasNext,
      );
      return Right(page);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> startJob({required String jobId, required String checklistId}) async {
    try {
      await _api.startJob(jobId: jobId, checklistId: checklistId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
