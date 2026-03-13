import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/inspection_form.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../mechanic_dashboard/data/dtos/repair_job_dtos.dart';
import '../../../mechanic_dashboard/data/repositories/repair_job_repository_impl.dart';

part 'inspection_details_view_model.g.dart';

@riverpod
class InspectionDetailsViewModel extends _$InspectionDetailsViewModel {
  @override
  Future<InspectionDetailsState> build(String jobId) async {
    final dio = ref.read(dioProvider);
    final repository = ref.read(repairJobRepositoryProvider);

    final detailResult = await repository.getMyJobDetail(jobId: jobId);

    return detailResult.fold(
      (failure) => throw failure,
      (detail) async {
        InspectionForm form;
        final baseJson = detail.job.checklistData;

        if (baseJson != null) {
          form = InspectionForm.fromJson(baseJson);
        } else if (detail.checklist?.jsonUrl != null) {
          final response = await dio.get(detail.checklist!.jsonUrl!);
          form = InspectionForm.fromJson(response.data);
        } else {
          throw Exception("Checklist data or URL is missing.");
        }

        final answers = <String, dynamic>{};

        for (final field in form.header) {
          if ((field.id == 'customerName' || field.id == 'customer_name') && detail.customerName != null) {
            answers[field.id] = detail.customerName;
          } else if ((field.id == 'customerContact' || field.id == 'customer_contact') && detail.customerPhoneNumber != null) {
            answers[field.id] = detail.customerPhoneNumber;
          } else if ((field.id == 'carNumber' || field.id == 'car_number') && detail.carNumber != null) {
            answers[field.id] = detail.carNumber;
          } else if (field.id == 'mileage' && detail.mileage != null) {
             answers[field.id] = detail.mileage.toString(); 
          }
        }

        if (baseJson != null) {
          if (baseJson['header'] is List) {
            for (final field in baseJson['header']) {
               if (field is Map && field['id'] != null && field['value'] != null && field['value'].toString().isNotEmpty) {
                 answers[field['id'].toString()] = field['value'];
               }
            }
          }
          if (baseJson['groups'] is List) {
            for (final group in baseJson['groups']) {
              if (group is Map && group['items'] is List) {
                for (final item in group['items']) {
                  if (item is Map && item['seq_no'] != null && item['value'] != null) {
                     answers[item['seq_no'].toString()] = item['value'];
                  }
                }
              }
            }
          }
        }

        return InspectionDetailsState(
          form: form,
          answers: answers,
          baseJson: baseJson,
        );
      },
    );
  }

  void updateAnswer(String key, dynamic value) {
    if (!state.hasValue) return;

    final currentState = state.value!;
    final newAnswers = Map<String, dynamic>.from(currentState.answers);
    newAnswers[key] = value;

    state = AsyncData(currentState.copyWith(answers: newAnswers));
  }

  Map<String, dynamic> _buildChecklistData(InspectionDetailsState currentState) {
    // Start with the original form JSON or previously saved checklistData
    // Use jsonEncode/Decode to ensure we are working with primitive Maps and deep copies
    final String raw = jsonEncode(currentState.baseJson ?? currentState.form.toJson());
    final Map<String, dynamic> json = jsonDecode(raw);
    
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
