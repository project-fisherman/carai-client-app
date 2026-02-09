import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/safety_checklist.dart';
import '../../data/repositories/safety_checklist_repository_impl.dart';

part 'checklist_selection_view_model.g.dart';

@riverpod
class ChecklistSelectionViewModel extends _$ChecklistSelectionViewModel {
  @override
  FutureOr<List<SafetyChecklist>> build() async {
    final repository = ref.watch(safetyChecklistRepositoryProvider);
    final result = await repository.getSafetyChecklists();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (checklists) => checklists,
    );
  }
}
