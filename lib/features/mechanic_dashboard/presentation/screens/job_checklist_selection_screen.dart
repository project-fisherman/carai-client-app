import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/foundations/app_colors.dart';
import '../../domain/entities/safety_checklist.dart';
import '../providers/checklist_management_view_model.dart';
import '../../data/repositories/repair_job_repository_impl.dart';
import '../../../../core/router/routes.dart';
import '../providers/mechanic_dashboard_view_model.dart';
import '../../data/dtos/repair_job_dtos.dart';
import 'package:go_router/go_router.dart';

class JobChecklistSelectionScreen extends ConsumerWidget {
  final String shopId;
  final String jobId;

  const JobChecklistSelectionScreen({
    super.key,
    required this.shopId,
    required this.jobId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checklistsAsync = ref.watch(shopChecklistsProvider(shopId));

    return AppScaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppNavigationBar(
        title: '점검표 선택',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textLight),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: checklistsAsync.when(
        data: (checklists) {
          if (checklists.isEmpty) {
            return Center(
              child: Text(
                '등록된 점검표가 없습니다.\n먼저 점검표를 등록해주세요.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textLight.withValues(alpha: 0.7)),
              ),
            );
          }
          return RefreshIndicator(
            color: AppColors.primary,
            backgroundColor: AppColors.surfaceDark,
            onRefresh: () async {
              ref.invalidate(shopChecklistsProvider(shopId));
            },
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent - 200) {
                  ref.read(shopChecklistsProvider(shopId).notifier).loadMore();
                }
                return false;
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: checklists.length,
                itemBuilder: (context, index) {
                  final checklist = checklists[index];
                  return _buildChecklistCard(context, ref, checklist);
                },
              ),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (err, stack) => Center(
          child: Text('오류: $err', style: const TextStyle(color: Colors.red)),
        ),
      ),
    );
  }

  Widget _buildChecklistCard(
    BuildContext context,
    WidgetRef ref,
    SafetyChecklist checklist,
  ) {
    return GestureDetector(
      onTap: () async {
        final shouldStart = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color(0xFF292524),
            title: const Text(
              '작업 시작',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              '\'${checklist.name}\' 점검표로\n작업을 시작하겠습니까?',
              style: const TextStyle(color: AppColors.textLight),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('취소', style: TextStyle(color: Colors.grey)),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('시작', style: TextStyle(color: AppColors.primary)),
              ),
            ],
          ),
        );

        if (shouldStart == true && context.mounted) {
          final repo = ref.read(repairJobRepositoryProvider);
          // Show loading overlay
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );

          final result = await repo.startJob(
            jobId: jobId,
            checklistId: checklist.id,
          );

          // Pop loading
          if (context.mounted) {
            Navigator.of(context).pop();
          }

          result.fold(
            (failure) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('시작 실패: ${failure.message}')),
                );
              }
            },
            (jobDetail) {
              if (context.mounted) {
                ref.invalidate(mechanicDashboardViewModelProvider(shopId));
                // pop checklist selection screen
                context.pop();
                // push inspection details
                InspectionDetailsRoute(
                  jobId: jobId,
                  isReadOnly: false,
                  $extra: jobDetail,
                ).push(context);
              }
            },
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2C),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                checklist.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[800],
                  child: const Icon(Icons.broken_image, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    checklist.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (checklist.isPreset) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '기본',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
