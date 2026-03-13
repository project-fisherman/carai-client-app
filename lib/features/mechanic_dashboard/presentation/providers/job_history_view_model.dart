import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../data/dtos/repair_job_dtos.dart';
import '../../domain/repositories/repair_job_repository.dart';
import '../../data/repositories/repair_job_repository_impl.dart';

part 'job_history_view_model.g.dart';

@riverpod
class JobHistoryViewModel extends _$JobHistoryViewModel {
  @override
  Future<List<RepairJobHistoryResponseDto>> build({
    required String shopId,
    required String date,
  }) async {
    return _fetchHistory(shopId: shopId, date: date);
  }

  Future<List<RepairJobHistoryResponseDto>> _fetchHistory({
    required String shopId,
    required String date,
  }) async {
    final repository = ref.read(repairJobRepositoryProvider);
    final result = await repository.getJobHistory(shopId: shopId, date: date);

    return result.fold(
      (failure) => throw failure,
      (history) => history,
    );
  }

  Future<void> updateDate(String newDate) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _fetchHistory(shopId: shopId, date: newDate),
    );
  }
}
