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
  /// 내 작업 조회 - 상태별
  Future<List<RepairJobResponseDto>> getMyJobs({String? status}) async {
    final response = await _dio.get(
      '/repair-shops/jobs/me',
      queryParameters: status != null ? {'status': status} : null,
    );
    final list = response.data['result'] as List;
    return list.map((e) => RepairJobResponseDto.fromJson(e)).toList();
  }
}
