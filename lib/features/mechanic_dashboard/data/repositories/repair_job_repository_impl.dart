import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../data_sources/repair_job_api.dart';
import '../dtos/repair_job_dtos.dart';
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
              reportUrl: jobDto.reportUrl,
              customerName: jobDto.intakeSummary?.customerName,
              carNumber: jobDto.intakeSummary?.carNumber,
              carModelCode: jobDto.intakeSummary?.carModelCode,
              createdAt: jobDto.createdAt,
              updatedAt: jobDto.updatedAt,
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
  Future<Either<Failure, RepairJobDetailResponseDto>> startJob({required String jobId, required String checklistId}) async {
    try {
      final detailDto = await _api.startJob(jobId: jobId, checklistId: checklistId);
      return Right(detailDto);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RepairJobDetailResponseDto>> saveJobProgress({required String jobId, required Map<String, dynamic> checklistData}) async {
    try {
      final detailDto = await _api.saveJobProgress(jobId: jobId, checklistData: checklistData);
      return Right(detailDto);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RepairJobDetailResponseDto>> completeJob({
    required String jobId,
    required Map<String, dynamic> checklistData,
  }) async {
    try {
      final detailDto = await _api.completeJob(
        jobId: jobId,
        checklistData: checklistData,
      );
      return Right(detailDto);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RepairJobDetailResponseDto>> resumeJob({required String jobId}) async {
    try {
      final detailDto = await _api.resumeJob(jobId: jobId);
      return Right(detailDto);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RepairJobDetailResponseDto>> getMyJobDetail({required String jobId}) async {
    try {
      final detailDto = await _api.getMyJobDetail(jobId: jobId);
      return Right(detailDto);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> generateReport({required String jobId}) async {
    try {
      await _api.generateReport(jobId: jobId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReportStatusResponseDto>> getReportStatus({required String jobId}) async {
    try {
      final statusDto = await _api.getReportStatus(jobId: jobId);
      return Right(statusDto);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RepairJobHistoryResponseDto>>> getJobHistory({
    required String shopId,
    required String date,
  }) async {
    try {
      final historyList = await _api.getJobHistory(shopId: shopId, date: date);
      return Right(historyList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
