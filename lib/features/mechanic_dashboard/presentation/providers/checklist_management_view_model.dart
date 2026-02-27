import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/safety_checklist.dart';
import '../../data/repositories/safety_checklist_repository_impl.dart';

part 'checklist_management_view_model.g.dart';

@riverpod
class ShopChecklists extends _$ShopChecklists {
  @override
  FutureOr<List<SafetyChecklist>> build(String shopId) async {
    final repository = ref.watch(safetyChecklistRepositoryProvider);
    final result = await repository.getShopChecklists(shopId: shopId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (checklists) => checklists,
    );
  }
}
