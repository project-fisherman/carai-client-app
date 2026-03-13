import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../dtos/repair_job_dtos.dart';

part 'repair_job_api.g.dart';

@riverpod
RepairJobApi repairJobApi(RepairJobApiRef ref) {
  return RepairJobApi(ref.watch(dioProvider));
}

class RepairJobApi {
  final Dio _dio;

  RepairJobApi(this._dio);

  /// GET /repair-shops/jobs/me
  /// 내 작업 조회 - 상태별, 커서 페이지네이션
  Future<MyJobsPageResponseDto> getMyJobs({
    String? status,
    String? cursorUpdatedAt,
    String? cursorId,
    int size = 20,
  }) async {
    final response = await _dio.get(
      '/repair-shops/jobs/me',
      queryParameters: {
        if (status != null) 'status': status,
        if (cursorUpdatedAt != null) 'cursorUpdatedAt': cursorUpdatedAt,
        if (cursorId != null) 'cursorId': cursorId,
        'size': size,
      },
    );
    final result = response.data['result'] as Map<String, dynamic>?;
    return MyJobsPageResponseDto.fromJson(result ?? {});
  }

  /// POST /repair-shops/jobs/{jobId}/start
  /// 작업 시작 (대기 중 -> 진행 중)
  Future<RepairJobDetailResponseDto> startJob({
    required String jobId,
    required String checklistId,
  }) async {
    final response = await _dio.post(
      '/repair-shops/jobs/$jobId/start',
      data: {'checklistId': checklistId},
    );
    return RepairJobDetailResponseDto.fromJson(response.data['result']);
  }

  /// POST /repair-shops/jobs/{jobId}/draft
  /// 작업 임시저장
  Future<RepairJobDetailResponseDto> saveJobProgress({
    required String jobId,
    required Map<String, dynamic> checklistData,
  }) async {
    final response = await _dio.post(
      '/repair-shops/jobs/$jobId/draft',
      data: {'checklistData': checklistData},
    );
    return RepairJobDetailResponseDto.fromJson(response.data['result']);
  }

  /// POST /repair-shops/jobs/{jobId}/resume
  /// 작업 재개 (진행 중 진입)
  Future<RepairJobDetailResponseDto> resumeJob({
    required String jobId,
  }) async {
    final response = await _dio.post(
      '/repair-shops/jobs/$jobId/resume',
    );
    return RepairJobDetailResponseDto.fromJson(response.data['result']);
  }

  /// GET /repair-shops/jobs/{jobId}
  /// 작업 상세 조회
  Future<RepairJobDetailResponseDto> getMyJobDetail({
    required String jobId,
  }) async {
    final response = await _dio.get(
      '/repair-shops/jobs/$jobId',
    );
    return RepairJobDetailResponseDto.fromJson(response.data['result']);
  }

  /// POST /repair-shops/jobs/{jobId}/complete
  /// 작업 종료
  Future<RepairJobDetailResponseDto> completeJob({
    required String jobId,
    required Map<String, dynamic> checklistData,
  }) async {
    final response = await _dio.post(
      '/repair-shops/jobs/$jobId/complete',
      data: {'checklistData': checklistData},
    );
    return RepairJobDetailResponseDto.fromJson(response.data['result']);
  }

  /// POST /repair-shops/jobs/{jobId}/report
  /// AI 소견서 생성
  Future<void> generateReport({
    required String jobId,
  }) async {
    await _dio.post(
      '/repair-shops/jobs/$jobId/report',
    );
  }

  /// GET /repair-shops/jobs/{jobId}/report/status
  /// AI 소견서 생성 상태 조회
  Future<ReportStatusResponseDto> getReportStatus({
    required String jobId,
  }) async {
    final response = await _dio.get(
      '/repair-shops/jobs/$jobId/report/status',
    );
    return ReportStatusResponseDto.fromJson(response.data['result']);
  }
}
