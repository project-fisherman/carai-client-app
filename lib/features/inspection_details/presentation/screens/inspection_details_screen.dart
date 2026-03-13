import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../design_system/molecules/app_scaffold.dart';
import '../../../../design_system/molecules/app_navigation_bar.dart';
import '../viewmodels/inspection_details_view_model.dart';
import '../widgets/dynamic_header_form.dart';
import '../widgets/inspection_group_widget.dart';

class InspectionDetailsScreen extends ConsumerStatefulWidget {
  final bool isReadOnly;

  const InspectionDetailsScreen({super.key, this.isReadOnly = false});

  @override
  ConsumerState<InspectionDetailsScreen> createState() =>
      _InspectionDetailsScreenState();
}

class _InspectionDetailsScreenState
    extends ConsumerState<InspectionDetailsScreen> {
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inspectionState = ref.watch(inspectionDetailsViewModelProvider);

    return AppScaffold(
      backgroundColor: const Color(0xFF1E1C1A),
      appBar: const AppNavigationBar(title: 'Inspection Details'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: inspectionState.when(
          data: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Dynamic Header
                DynamicHeaderForm(
                  fields: state.form.header,
                  answers: state.answers,
                  onAnswerChanged: (id, value) {
                    ref
                        .read(inspectionDetailsViewModelProvider.notifier)
                        .updateAnswer(id, value);
                  },
                ),
                const SizedBox(height: 16),

                // AI Inspection Card (Status)
                // Assuming status is in meta or we keep the static one for now?
                // The prompt asked to keep "Ai Inspection항목과 Ocr scan은 구현하지 않을꺼야" or implied checking existing design.
                // The previous code had it. Let's keep a simplified version or just the groups as requested.
                // "서버에서 Example과 같은 json을 내려준다고할때, 디자인은 기존의 형태를 유지하면서..."
                // So I will keep the AI Card if it makes sense, but focus on the groups.
                // The header implementation above replaces the static car info.
                const SizedBox(height: 24),

                // Groups
                ...state.form.groups.map((group) {
                  return InspectionGroupWidget(
                    group: group,
                    allAnswers: state.answers,
                    onItemAnswerChanged: (seq, value) {
                      ref
                          .read(inspectionDetailsViewModelProvider.notifier)
                          .updateAnswer(seq.toString(), value);
                    },
                  );
                }),

                const SizedBox(height: 24),

                // General Notes (using state or local controller? VM has submit(form))
                // We can bind this to the 'overall_opinion' if it existed in schema, but schema removed it?
                // Wait, schema removed 'footer' and 'group_opinion'.
                // But usually there is a general note. I'll keep it but maybe not bind to schema yet if not present.
                // User said "remove footer".
                // Let's just have the SAVE button.
                if (!widget.isReadOnly)
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE65100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        ref
                            .read(inspectionDetailsViewModelProvider.notifier)
                            .submit();
                      },
                      child: const Text(
                        'SAVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 32),
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(color: Color(0xFFE65100)),
          ),
          error: (err, stack) => Center(
            child: Text(
              'Error: $err',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
