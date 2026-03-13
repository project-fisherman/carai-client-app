import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../inspection_details/domain/entities/inspection_form.dart';
import '../entities/safety_checklist.dart';
import '../entities/checklist_page.dart';

abstract class SafetyChecklistRepository {
  Future<Either<Failure, ChecklistPage>> getSafetyChecklists({
    required String shopId,
    bool? isPreset,
    String? lastId,
    int size = 20,
  });

  Future<Either<Failure, InspectionForm>> getChecklistPreview(String jsonUrl);

  Future<Either<Failure, ChecklistPage>> getShopChecklists({
    required String shopId,
    String? lastId,
    int size = 20,
  });

  Future<Either<Failure, SafetyChecklist>> registerShopChecklist({
    required String shopId,
    required String checklistId,
  });

  Future<Either<Failure, void>> removeShopChecklists({
    required String shopId,
    required List<String> checklistIds,
  });
}
