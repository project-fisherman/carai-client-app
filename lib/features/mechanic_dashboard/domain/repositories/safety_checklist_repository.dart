import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/safety_checklist.dart';

abstract class SafetyChecklistRepository {
  Future<Either<Failure, List<SafetyChecklist>>> getSafetyChecklists({
    bool? isPreset,
  });
}
