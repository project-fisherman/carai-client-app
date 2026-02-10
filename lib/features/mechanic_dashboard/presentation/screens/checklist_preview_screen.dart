import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../design_system/molecules/app_scaffold.dart';
import '../../../../design_system/molecules/app_navigation_bar.dart';
import '../../../inspection_details/presentation/widgets/dynamic_header_form.dart';
import '../../../inspection_details/presentation/widgets/inspection_group_widget.dart';
import '../providers/checklist_preview_view_model.dart';
import 'package:go_router/go_router.dart';

class ChecklistPreviewScreen extends ConsumerStatefulWidget {
  final String jsonUrl;
  final String checklistName;

  const ChecklistPreviewScreen({
    super.key,
    required this.jsonUrl,
    required this.checklistName,
  });

  @override
  ConsumerState<ChecklistPreviewScreen> createState() =>
      _ChecklistPreviewScreenState();
}

class _ChecklistPreviewScreenState
    extends ConsumerState<ChecklistPreviewScreen> {
  // Local state for preview interactivity
  // We can just use a Map<String, dynamic> like in InspectionDetailsScreen,
  // but since it's preview only, we don't need to persist or validate much.
  final Map<String, dynamic> _answers = {};

  @override
  Widget build(BuildContext context) {
    final formAsync = ref.watch(
      checklistPreviewViewModelProvider(widget.jsonUrl),
    );

    return AppScaffold(
      backgroundColor: const Color(0xFF1E1C1A),
      appBar: AppNavigationBar(
        title: widget.checklistName,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: formAsync.when(
        data: (form) {
          if (form == null) {
            return const Center(
              child: Text(
                'No preview available.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Preview
                DynamicHeaderForm(
                  fields: form.header,
                  answers: _answers,
                  onAnswerChanged: (id, value) {
                    setState(() {
                      _answers[id] = value;
                    });
                  },
                ),
                const SizedBox(height: 24),

                // Groups Preview
                ...form.groups.map((group) {
                  return InspectionGroupWidget(
                    group: group,
                    allAnswers: _answers,
                    onItemAnswerChanged: (seq, value) {
                      setState(() {
                        // Store answers by sequence number as string, same as main logic
                        _answers[seq.toString()] = value;
                      });
                    },
                  );
                }),

                const SizedBox(height: 24),
                // Start Inspection Button (Placeholder action)
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
                      // TODO: Navigate to create inspection with this checklist logic
                      // For now just pop or show message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Starting inspection from this template is not implemented yet.',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'START INSPECTION',
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
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFFE65100)),
        ),
        error: (err, stack) => Center(
          child: Text(
            'Error loading preview: $err',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
