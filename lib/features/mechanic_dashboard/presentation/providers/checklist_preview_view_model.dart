import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../inspection_details/domain/entities/inspection_form.dart';
import '../../domain/usecases/get_checklist_preview_usecase.dart';

part 'checklist_preview_view_model.g.dart';

@riverpod
class ChecklistPreviewViewModel extends _$ChecklistPreviewViewModel {
  @override
  FutureOr<InspectionForm?> build(String jsonUrl) async {
    // Return null initially if url is empty, but it shouldn't be.
    if (jsonUrl.isEmpty) return null;

    final useCase = ref.watch(getChecklistPreviewUseCaseProvider);
    final result = await useCase.execute(jsonUrl);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (form) => form,
    );
  }
}
