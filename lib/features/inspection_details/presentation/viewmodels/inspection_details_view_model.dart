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

    state = AsyncData(currentState.copyWith(
      answers: newAnswers,
      baseJson: detail.job.checklistData,
    ));
  }

  Map<String, dynamic> _buildChecklistData(InspectionDetailsState currentState) {
    // Start with the original form JSON or previously saved checklistData
    final Map<String, dynamic> json = Map.from(currentState.baseJson ?? currentState.form.toJson());
    
    // Inject header values
    if (json['header'] is List) {
      final headerList = json['header'] as List;
      for (int i = 0; i < headerList.length; i++) {
        final field = headerList[i] as Map<String, dynamic>;
        final String? id = field['id'] as String?;
        if (id != null && currentState.answers.containsKey(id)) {
          field['value'] = currentState.answers[id];
        }
      }
    }

    // Inject group item values
    if (json['groups'] is List) {
      final groupsList = json['groups'] as List;
      for (int i = 0; i < groupsList.length; i++) {
        final group = groupsList[i] as Map<String, dynamic>;
        if (group['items'] is List) {
          final itemsList = group['items'] as List;
          for (int j = 0; j < itemsList.length; j++) {
            final item = itemsList[j] as Map<String, dynamic>;
            final String seq = item['seq_no']?.toString() ?? '';
            if (seq.isNotEmpty && currentState.answers.containsKey(seq)) {
              item['value'] = currentState.answers[seq];
            }
          }
        }
      }
    }
    return json;
  }

  Future<bool> saveDraft(String jobId) async {
    if (!state.hasValue) return false;
    final currentState = state.value!;
    
    final payload = _buildChecklistData(currentState);

    final repository = ref.read(repairJobRepositoryProvider);
    state = const AsyncLoading();

    final result = await repository.saveJobProgress(
      jobId: jobId,
      checklistData: payload,
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

    final payload = _buildChecklistData(currentState);

    final repository = ref.read(repairJobRepositoryProvider);
    state = const AsyncLoading();

    // First, save the current progress
    final saveResult = await repository.saveJobProgress(
      jobId: jobId,
      checklistData: payload,
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
  final Map<String, dynamic>? baseJson;

  InspectionDetailsState({required this.form, required this.answers, this.baseJson});

  InspectionDetailsState copyWith({
    InspectionForm? form,
    Map<String, dynamic>? answers,
    Map<String, dynamic>? baseJson,
  }) {
    return InspectionDetailsState(
      form: form ?? this.form,
      answers: answers ?? this.answers,
      baseJson: baseJson ?? this.baseJson,
    );
  }
}
