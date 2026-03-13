import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../mechanic_dashboard/data/repositories/repair_job_repository_impl.dart';

part 'ai_report_view_model.freezed.dart';
part 'ai_report_view_model.g.dart';

@freezed
class AiReportState with _$AiReportState {
  const factory AiReportState({
    @Default(false) bool isGenerating,
    @Default(false) bool isFailed,
    @Default(false) bool isSending,
    @Default(false) bool isSent,
    @Default(false) bool showSentSuccess, // 추가: 성공 메시지 노출 여부
    String? reportUrl,
  }) = _AiReportState;
}

@riverpod
class AiReportViewModel extends _$AiReportViewModel {
  Timer? _pollingTimer;
  Timer? _cooldownTimer; // 추가: 쿨다운 타이머

  @override
  FutureOr<AiReportState> build(String jobId) async {
    ref.onDispose(() {
      _pollingTimer?.cancel();
      _cooldownTimer?.cancel();
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
          return const AiReportState(isGenerating: true);
        } else if (dto.job.status == 'REPORT_FAILED') {
          return const AiReportState(isFailed: true);
        } else {
          return const AiReportState();
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

  Future<void> sendReport() async {
    final currentState = state.valueOrNull;
    if (currentState == null || currentState.reportUrl == null) return;

    state = AsyncData(currentState.copyWith(isSending: true, isSent: false, showSentSuccess: false));

    final repository = ref.read(repairJobRepositoryProvider);
    final result = await repository.sendReport(jobId: jobId);

    result.fold(
      (failure) {
        state = AsyncData(currentState.copyWith(isSending: false, isSent: false, showSentSuccess: false));
        throw Exception(failure.message);
      },
      (_) {
        state = AsyncData(currentState.copyWith(isSending: false, isSent: true, showSentSuccess: true));
        
        // 3초 후 성공 메시지 숨기고 다시 버튼으로 복구
        _cooldownTimer?.cancel();
        _cooldownTimer = Timer(const Duration(seconds: 3), () {
          final nextState = state.valueOrNull;
          if (nextState != null) {
            state = AsyncData(nextState.copyWith(showSentSuccess: false));
          }
        });
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
            // keep polling but make sure state is isGenerating
            if (state.valueOrNull?.isGenerating != true) {
              state = const AsyncData(AiReportState(isGenerating: true));
            }
          } else if (dto.status == 'REPORT_FAILED') {
            timer.cancel();
            state = const AsyncData(AiReportState(isFailed: true));
          } else {
            timer.cancel();
            state = AsyncError('소견서 생성 중 상태 오류입니다: ${dto.status}', StackTrace.current);
          }
        },
      );
    });
  }
}
