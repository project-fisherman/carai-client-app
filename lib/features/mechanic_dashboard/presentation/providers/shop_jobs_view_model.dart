import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/dtos/repair_job_dtos.dart';
import '../../data/repositories/repair_job_repository_impl.dart';

part 'shop_jobs_view_model.g.dart';

@riverpod
class ShopJobsViewModel extends _$ShopJobsViewModel {
  String? _nextCursorUpdatedAt;
  String? _nextCursorId;
  bool _hasNext = true;
  bool _isLoadingMore = false;

  @override
  FutureOr<List<RepairJobResponseDto>> build(String shopId) async {
    _nextCursorUpdatedAt = null;
    _nextCursorId = null;
    _hasNext = true;
    _isLoadingMore = false;
    
    return _fetchPage(shopId);
  }

  Future<List<RepairJobResponseDto>> _fetchPage(String shopId) async {
    final result = await ref.read(repairJobRepositoryProvider).getShopJobs(
      shopId: shopId,
      cursorUpdatedAt: _nextCursorUpdatedAt,
      cursorId: _nextCursorId,
      size: 20,
    );
    
    return result.fold(
      (failure) => throw failure,
      (page) {
        _nextCursorUpdatedAt = page.nextCursorUpdatedAt;
        _nextCursorId = page.nextCursorId;
        _hasNext = page.hasNext;
        return page.jobs;
      },
    );
  }

  Future<void> loadMore(String shopId) async {
    if (!_hasNext || _isLoadingMore) return;
    _isLoadingMore = true;

    try {
      final newJobs = await _fetchPage(shopId);
      final currentJobs = state.value ?? [];
      state = AsyncData([...currentJobs, ...newJobs]);
    } catch (e, st) {
      // Handle error
    } finally {
      _isLoadingMore = false;
    }
  }
}
