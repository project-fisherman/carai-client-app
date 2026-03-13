import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/inspection_form.dart';
import '../../data/repositories/mock_inspection_repository.dart';
import '../../../mechanic_dashboard/data/dtos/repair_job_dtos.dart';
import '../../../mechanic_dashboard/data/repositories/repair_job_repository_impl.dart';

part 'inspection_details_view_model.g.dart';

@riverpod
class InspectionDetailsViewModel extends _$InspectionDetailsViewModel {
  // Use a customized state object if needed, but for now we can rely on a class
  // containing both form and answers, or just handle answers in a separate provider.
  // Ideally, this VM should expose the Form and hold the local state of answers.

  // Let's create a local state class for this VM
  @override
  Future<InspectionDetailsState> build() async {
    final repository = ref.read(inspectionRepositoryProvider);
    final result = await repository.getInspectionForm();

    return result.fold(
      (failure) => throw failure,
      (form) => InspectionDetailsState(
        form: form,
        answers: {}, // Start with empty answers
      ),
    );
  }

  void updateAnswer(String key, dynamic value) {
    if (!state.hasValue) return;

    final currentState = state.value!;
    final newAnswers = Map<String, dynamic>.from(currentState.answers);
    newAnswers[key] = value;

    state = AsyncData(currentState.copyWith(answers: newAnswers));
  }

  void initializeWithJobDetail(RepairJobDetailResponseDto detail) {
    if (!state.hasValue) return;

    final currentState = state.value!;
    final newAnswers = Map<String, dynamic>.from(currentState.answers);

    for (final field in currentState.form.header) {
      if (field.id == 'customer_name' && detail.customerName != null) {
        newAnswers[field.id] = detail.customerName;
      } else if (field.id == 'customer_contact' && detail.customerPhoneNumber != null) {
        newAnswers[field.id] = detail.customerPhoneNumber;
      } else if (field.id == 'car_number' && detail.carNumber != null) {
        newAnswers[field.id] = detail.carNumber;
      } else if (field.id == 'mileage' && detail.mileage != null) {
        newAnswers[field.id] = detail.mileage.toString(); // API typically serves as numbers but headers often parse as strings.
      }
    }

    state = AsyncData(currentState.copyWith(answers: newAnswers));
  }

  Future<bool> saveDraft(String jobId) async {
    if (!state.hasValue) return false;
    final currentState = state.value!;
    
    final repository = ref.read(repairJobRepositoryProvider);
    state = const AsyncLoading();

    final result = await repository.saveJobProgress(
      jobId: jobId,
      checklistData: currentState.answers,
    );

    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = AsyncData(currentState);
        return true;
      },
    );
  }

  Future<bool> submit(String jobId) async {
    if (!state.hasValue) return false;
    final currentState = state.value!;

    final repository = ref.read(repairJobRepositoryProvider);
    state = const AsyncLoading();

    // First, save the current progress
    final saveResult = await repository.saveJobProgress(
      jobId: jobId,
      checklistData: currentState.answers,
    );

    return saveResult.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) async {
        // Then complete the job
        final completeResult = await repository.completeJob(jobId: jobId);
        return completeResult.fold(
          (failure) {
            state = AsyncError(failure, StackTrace.current);
            return false;
          },
          (_) {
            state = AsyncData(currentState);
            return true;
          },
        );
      },
    );
  }
}

class InspectionDetailsState {
  final InspectionForm form;
  final Map<String, dynamic> answers;

  InspectionDetailsState({required this.form, required this.answers});

  InspectionDetailsState copyWith({
    InspectionForm? form,
    Map<String, dynamic>? answers,
  }) {
    return InspectionDetailsState(
      form: form ?? this.form,
      answers: answers ?? this.answers,
    );
  }
}
