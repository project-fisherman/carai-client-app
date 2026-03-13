import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../dashboard/data/data_sources/repair_shop_api.dart';
import '../../../dashboard/data/dtos/mechanic_dashboard_dtos.dart';
import '../../domain/entities/repair_job.dart';
import '../../data/repositories/repair_job_repository_impl.dart';

part 'mechanic_dashboard_view_model.g.dart';

@riverpod
class MechanicDashboardViewModel extends _$MechanicDashboardViewModel {
  String? _nextCursorUpdatedAt;
  String? _nextCursorId;
  bool _hasNext = true;
  bool _isLoadingMore = false;

  @override
  FutureOr<List<RepairJob>> build(String shopId) async {
    _nextCursorUpdatedAt = null;
    _nextCursorId = null;
    _hasNext = true;
    _isLoadingMore = false;
    
    return _fetchPage();
  }

  Future<List<RepairJob>> _fetchPage() async {
    final result = await ref.read(repairJobRepositoryProvider).getMyJobs(
      cursorUpdatedAt: _nextCursorUpdatedAt,
      cursorId: _nextCursorId,
      size: 20,
    );

    return result.fold(
      (failure) => throw Exception(failure.message),
      (page) {
        _nextCursorUpdatedAt = page.nextCursorUpdatedAt;
        _nextCursorId = page.nextCursorId;
        _hasNext = page.hasNext;
        return page.jobs.where((job) => job.repairShopId == shopId).toList();
      },
    );
  }

  Future<void> loadMore() async {
    if (!_hasNext || _isLoadingMore) return;
    _isLoadingMore = true;

    try {
      final newJobs = await _fetchPage();
      final currentJobs = state.value ?? [];
      state = AsyncData([...currentJobs, ...newJobs]);
    } catch (e, st) {
      // Optionally handle error
    } finally {
      _isLoadingMore = false;
    }
  }
}

@riverpod
Future<RepairShopRole> mechanicDashboardUserRole(
  MechanicDashboardUserRoleRef ref,
  String shopId,
) async {
  final api = ref.watch(repairShopApiProvider);
  final profile = await api.getMyProfile(shopId: shopId);
  return profile.role;
}
