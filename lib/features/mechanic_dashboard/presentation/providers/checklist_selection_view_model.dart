import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/safety_checklist.dart';
import '../../data/repositories/safety_checklist_repository_impl.dart';

part 'checklist_selection_view_model.g.dart';

@riverpod
class ChecklistSelectionViewModel extends _$ChecklistSelectionViewModel {
  String? _nextLastId;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  @override
  FutureOr<List<SafetyChecklist>> build(String shopId) async {
    _nextLastId = null;
    _hasMore = true;
    _isLoadingMore = false;
    
    return _fetchPage();
  }

  Future<List<SafetyChecklist>> _fetchPage() async {
    final repository = ref.read(safetyChecklistRepositoryProvider);
    final result = await repository.getSafetyChecklists(
      shopId: shopId,
      lastId: _nextLastId,
      size: 20,
    );

    return result.fold(
      (failure) => throw Exception(failure.message),
      (page) {
        _nextLastId = page.nextLastId;
        _hasMore = page.hasMore;
        return page.items;
      },
    );
  }

  Future<void> loadMore() async {
    if (!_hasMore || _isLoadingMore) return;
    _isLoadingMore = true;

    try {
      final newItems = await _fetchPage();
      final currentItems = state.value ?? [];
      state = AsyncData([...currentItems, ...newItems]);
    } catch (e, st) {
      // Optionally handle error
    } finally {
      _isLoadingMore = false;
    }
  }
}
