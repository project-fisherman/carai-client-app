import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../dtos/safety_checklist_dtos.dart';

part 'safety_checklist_api.g.dart';

@riverpod
SafetyChecklistApi safetyChecklistApi(SafetyChecklistApiRef ref) {
  return SafetyChecklistApi(ref.watch(dioProvider));
}

class SafetyChecklistApi {
  final Dio _dio;

  SafetyChecklistApi(this._dio);

  Future<List<SafetyChecklistResponseDto>> getSafetyChecklists({
    bool? isPreset,
  }) async {
    final response = await _dio.get(
      '/safety-checklists',
      queryParameters: isPreset != null ? {'isPreset': isPreset} : null,
    );
    final list = response.data['result'] as List;
    return list.map((e) => SafetyChecklistResponseDto.fromJson(e)).toList();
  }
}
