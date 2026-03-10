import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../design_system/molecules/app_scaffold.dart';
import '../../../../design_system/molecules/app_navigation_bar.dart';
import '../../../../design_system/foundations/app_colors.dart';
import '../../../inspection_details/presentation/widgets/dynamic_header_form.dart';
import '../../../inspection_details/presentation/widgets/inspection_group_widget.dart';
import '../providers/checklist_preview_view_model.dart';
import '../providers/checklist_management_view_model.dart';
import '../providers/checklist_selection_view_model.dart';
import '../../data/repositories/safety_checklist_repository_impl.dart';
import 'package:go_router/go_router.dart';

class ChecklistPreviewScreen extends ConsumerStatefulWidget {
  final String shopId;
  final String checklistId;
  final String jsonUrl;
  final String checklistName;
  final String imageUrl;

  const ChecklistPreviewScreen({
    super.key,
    required this.shopId,
    required this.checklistId,
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
                  color: AppColors.surfaceDark,
                  padding: const EdgeInsets.all(32),
                  child: const Icon(
                    Icons.broken_image,
                    color: AppColors.textLight,
                    size: 48,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColors.textLight,
                  size: 32,
                ),
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
      backgroundColor: AppColors.backgroundDark,
      appBar: AppNavigationBar(
        title: widget.checklistName,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textLight),
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
                  border: Border.all(color: AppColors.textLight, width: 1),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    color: AppColors.textLight,
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
                style: TextStyle(color: AppColors.textLight),
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
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      final nav = Navigator.of(context);
                      final scaffold = ScaffoldMessenger.of(context);

                      try {
                        final repository = ref.read(
                          safetyChecklistRepositoryProvider,
                        );
                        final result = await repository.registerShopChecklist(
                          shopId: widget.shopId,
                          checklistId: widget.checklistId,
                        );

                        result.fold(
                          (failure) {
                            scaffold.showSnackBar(
                              SnackBar(
                                content: Text('등록 실패: ${failure.message}'),
                              ),
                            );
                          },
                          (success) {
                            // Invalidate providers to refresh the lists
                            ref.invalidate(
                              shopChecklistsProvider(widget.shopId),
                            );
                            ref.invalidate(
                              checklistSelectionViewModelProvider(
                                widget.shopId,
                              ),
                            );

                            scaffold.showSnackBar(
                              const SnackBar(
                                content: Text('점검표가 성공적으로 등록되었습니다.'),
                              ),
                            );
                            nav.pop();
                            nav.pop(); // Pop back to dashbaord
                          },
                        );
                      } catch (e) {
                        scaffold.showSnackBar(
                          SnackBar(content: Text('오류 발생: $e')),
                        );
                      }
                    },
                    child: const Text(
                      '체크리스트 등록',
                      style: TextStyle(
                        color: AppColors.textLight,
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
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (err, stack) => Center(
          child: Text(
            'Error loading preview: $err',
            style: const TextStyle(color: AppColors.placeholder),
          ),
        ),
      ),
    );
  }
}
