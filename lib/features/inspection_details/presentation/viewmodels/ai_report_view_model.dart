import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../mechanic_dashboard/data/repositories/repair_job_repository_impl.dart';

part 'ai_report_view_model.g.dart';

@riverpod
class AiReportViewModel extends _$AiReportViewModel {
  @override
  FutureOr<String> build(String jobId) async {
    // 1. Call generateReport API
    final repository = ref.read(repairJobRepositoryProvider);
    final result = await repository.generateReport(jobId: jobId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (dto) {
        // 2. Just return the reportUrl (which is a PDF)
        return dto.reportUrl;
      },
    );
  }
}
