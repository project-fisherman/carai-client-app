import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../inspection_details/domain/entities/inspection_form.dart';
import '../entities/safety_checklist.dart';

abstract class SafetyChecklistRepository {
  Future<Either<Failure, List<SafetyChecklist>>> getSafetyChecklists({
    bool? isPreset,
  });

  Future<Either<Failure, InspectionForm>> getChecklistPreview(String jsonUrl);

  Future<Either<Failure, SafetyChecklist>> registerShopChecklist({
    required String shopId,
    required String checklistId,
  });
}
