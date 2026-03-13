import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../mechanic_dashboard/data/repositories/repair_job_repository_impl.dart';

part 'ai_report_view_model.g.dart';

class AiReportState {
  final bool isGenerating;
  final String? reportUrl;
  const AiReportState({this.isGenerating = false, this.reportUrl});
}

@riverpod
class AiReportViewModel extends _$AiReportViewModel {
  Timer? _pollingTimer;

  @override
  FutureOr<AiReportState> build(String jobId) async {
    ref.onDispose(() {
      _pollingTimer?.cancel();
    });

    final repository = ref.read(repairJobRepositoryProvider);
    final result = await repository.getMyJobDetail(jobId: jobId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (dto) {
        if (dto.job.status == 'REPORT_COMPLETED' && dto.job.reportUrl != null) {
          return AiReportState(isGenerating: false, reportUrl: dto.job.reportUrl);
        } else if (dto.job.status == 'REPORT_GENERATING') {
          _startPolling();
          return const AiReportState(isGenerating: true, reportUrl: null);
        } else {
          return const AiReportState(isGenerating: false, reportUrl: null);
        }
      },
    );
  }

  Future<void> generateReport() async {
    state = const AsyncData(AiReportState(isGenerating: true, reportUrl: null));

    final repository = ref.read(repairJobRepositoryProvider);
    final result = await repository.generateReport(jobId: jobId);

    result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
      },
      (_) {
        _startPolling();
      },
    );
  }

  void _startPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final repository = ref.read(repairJobRepositoryProvider);
      final result = await repository.getReportStatus(jobId: jobId);

      result.fold(
        (failure) {
          timer.cancel();
          state = AsyncError(failure.message, StackTrace.current);
        },
        (dto) async {
          if (dto.status == 'REPORT_COMPLETED') {
            timer.cancel();
            
            // FETCH FULL DETAIL TO GET URL
            final detailResult = await repository.getMyJobDetail(jobId: jobId);
            
            detailResult.fold(
              (failure) {
                state = AsyncError(failure.message, StackTrace.current);
              },
              (detailDto) {
                if (detailDto.job.reportUrl != null) {
                  state = AsyncData(AiReportState(isGenerating: false, reportUrl: detailDto.job.reportUrl));
                } else {
                  state = AsyncError('소견서가 생성되었으나 PDF 주소를 찾을 수 없습니다.', StackTrace.current);
                }
              }
            );
          } else if (dto.status == 'REPORT_GENERATING') {
            // keep polling
          } else {
            timer.cancel();
            state = AsyncError('소견서 생성 중 상태 오류입니다: ${dto.status}', StackTrace.current);
          }
        },
      );
    });
  }
}
