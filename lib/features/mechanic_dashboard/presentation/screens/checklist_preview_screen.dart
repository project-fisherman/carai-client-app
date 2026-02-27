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
  final String imageUrl;

  const ChecklistPreviewScreen({
    super.key,
    required this.jsonUrl,
    required this.checklistName,
    required this.imageUrl,
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

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            InteractiveViewer(
              panEnabled: true,
              scaleEnabled: true,
              minScale: 1.0,
              maxScale: 4.0,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[800],
                  padding: const EdgeInsets.all(32),
                  child: const Icon(
                    Icons.broken_image,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 32),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => _showImageDialog(context),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
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
                // Register checklist Button (Placeholder action)
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
                      '체크리스트 등록',
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
