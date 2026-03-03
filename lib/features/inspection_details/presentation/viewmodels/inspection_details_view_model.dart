import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/inspection_form.dart';
import '../../data/repositories/mock_inspection_repository.dart';

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

  Future<void> submit() async {
    if (!state.hasValue) return;
    final currentState = state.value!;

    final repository = ref.read(inspectionRepositoryProvider);
    state = const AsyncLoading();

    final result = await repository.submitInspection(
      currentState.form.meta.id,
      currentState.answers,
    );

    result.fold((failure) => state = AsyncError(failure, StackTrace.current), (
      _,
    ) {
      // Restore state with success indication? Or just keep data.
      state = AsyncData(currentState);
    });
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
