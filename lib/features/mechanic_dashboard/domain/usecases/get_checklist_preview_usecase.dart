import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../inspection_details/domain/entities/inspection_form.dart';
import '../repositories/safety_checklist_repository.dart';
import '../../data/repositories/safety_checklist_repository_impl.dart';

part 'get_checklist_preview_usecase.g.dart';

@riverpod
GetChecklistPreviewUseCase getChecklistPreviewUseCase(
  GetChecklistPreviewUseCaseRef ref,
) {
  return GetChecklistPreviewUseCase(
    ref.watch(safetyChecklistRepositoryProvider),
  );
}

class GetChecklistPreviewUseCase {
  final SafetyChecklistRepository _repository;

  GetChecklistPreviewUseCase(this._repository);

  Future<Either<Failure, InspectionForm>> execute(String jsonUrl) {
    return _repository.getChecklistPreview(jsonUrl);
  }
}
