import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../features/inspection_details/domain/entities/inspection_form.dart';
import '../dtos/safety_checklist_dtos.dart';

part 'safety_checklist_api.g.dart';

@riverpod
SafetyChecklistApi safetyChecklistApi(SafetyChecklistApiRef ref) {
  return SafetyChecklistApi(ref.watch(dioProvider));
}

class SafetyChecklistApi {
  final Dio _dio;

  SafetyChecklistApi(this._dio);

  Future<PagedChecklistResponseDto> getSafetyChecklists({
    required String shopId,
    bool? isPreset,
    String? lastId,
    int size = 20,
  }) async {
    final response = await _dio.get(
      '/repair-shops/$shopId/safety-checklists/unregistered',
      queryParameters: {
        if (isPreset != null) 'isPreset': isPreset,
        if (lastId != null) 'lastId': lastId,
        'size': size,
      },
    );
    return PagedChecklistResponseDto.fromJson(response.data['result']);
  }

  Future<PagedChecklistResponseDto> getShopChecklists({
    required String shopId,
    String? lastId,
    int size = 20,
  }) async {
    final response = await _dio.get(
      '/repair-shops/$shopId/safety-checklists/registered',
      queryParameters: {
        if (lastId != null) 'lastId': lastId,
        'size': size,
      },
    );
    return PagedChecklistResponseDto.fromJson(response.data['result']);
  }

  Future<InspectionForm> getChecklistPreview(String jsonUrl) async {
    // If jsonUrl is a full URL, Dio handles it.
    // If it's a relative path, we might need to handle it, but usually these are full URLs or relative to base.
    // Assuming full URL or handled by Dio's baseUrl if relative.
    // However, if it's from a different server (e.g. S3), we should ensure we use the full URL.
    final response = await _dio.get(jsonUrl);
    return InspectionForm.fromJson(response.data);
  }

  Future<SafetyChecklistResponseDto> registerShopChecklist({
    required String shopId,
    required String checklistId,
  }) async {
    final response = await _dio.post(
      '/repair-shops/$shopId/safety-checklists/$checklistId',
    );
    return SafetyChecklistResponseDto.fromJson(response.data['result']);
  }

  Future<void> removeShopChecklists({
    required String shopId,
    required List<String> checklistIds,
  }) async {
    await _dio.post(
      '/repair-shops/$shopId/safety-checklists/remove',
      data: {'checklistIds': checklistIds},
    );
  }
}
