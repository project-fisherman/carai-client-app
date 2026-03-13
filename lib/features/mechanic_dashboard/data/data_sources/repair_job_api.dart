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
}
