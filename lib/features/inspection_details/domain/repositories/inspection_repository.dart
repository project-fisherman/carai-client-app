import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/inspection_form.dart';

abstract class InspectionRepository {
  Future<Either<Failure, InspectionForm>> getInspectionForm();
  // We save the answers, but for now let's just accept the form or a map of answers?
  // The usage in VM was saving the whole form. Let's keep it simple for now and say we save the answers map.
  // Actually, let's keep it similar to before but taking the form + answers or just generic.
  Future<Either<Failure, void>> submitInspection(
    String formId,
    Map<String, dynamic> answers,
  );
}
