import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../data/dtos/repair_job_dtos.dart';
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

  /// 업장 전체 작업 목록 조회
  Future<Either<Failure, ShopJobsPageResponseDto>> getShopJobs({
    required String shopId,
    String? status,
    String? cursorUpdatedAt,
    String? cursorId,
    int size = 20,
  });

  /// 작업 시작
  Future<Either<Failure, RepairJobDetailResponseDto>> startJob({required String jobId, required String checklistId});

  /// 작업 임시저장
  Future<Either<Failure, RepairJobDetailResponseDto>> saveJobProgress({required String jobId, required Map<String, dynamic> checklistData});

  /// 작업 종료
  Future<Either<Failure, RepairJobDetailResponseDto>> completeJob({
    required String jobId,
    required Map<String, dynamic> checklistData,
  });

  /// 임시저장 작업 재개
  Future<Either<Failure, RepairJobDetailResponseDto>> resumeJob({required String jobId});

  /// 작업 상세 조회
  Future<Either<Failure, RepairJobDetailResponseDto>> getMyJobDetail({required String jobId});

  /// AI 소견서 생성 메세지 전송 (비동기)
  Future<Either<Failure, void>> generateReport({required String jobId});

  /// AI 소견서 생성 상태 폴링
  Future<Either<Failure, ReportStatusResponseDto>> getReportStatus({required String jobId});

  /// 업장 작업 내역 (history) 날짜별 조회
  Future<Either<Failure, List<RepairJobHistoryResponseDto>>> getJobHistory({
    required String shopId,
    required String date,
  });

  /// AI 소견서 SMS 발송
  Future<Either<Failure, void>> sendReport({required String jobId});
}
