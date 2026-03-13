import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/router/routes.dart';
import '../../domain/entities/repair_shop_user.dart';
import '../providers/mechanic_dashboard_view_model.dart';
import '../providers/checklist_management_view_model.dart';
import '../../data/repositories/repair_job_repository_impl.dart';
import '../widgets/service_queue_card.dart';

class MechanicDashboardScreen extends ConsumerWidget {
  final String shopId;

  const MechanicDashboardScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the view model to get job list
    final vehicleListAsync = ref.watch(
      mechanicDashboardViewModelProvider(shopId),
    );

    return AppScaffold(
      backgroundColor: AppColors.backgroundDark, // background-dark
      appBar: AppNavigationBar(
        title: '작업 대기열',
        actions: [
          // Profile Button (Right)
          Consumer(
            builder: (context, ref, child) {
              final roleAsync = ref.watch(
                mechanicDashboardUserRoleProvider(shopId),
              );
              return IconButton(
                icon: const Icon(
                  Icons.account_circle,
                  color: AppColors.textLight,
                  size: 28,
                ),
                onPressed: () {
                  // We need to map the DTO role to the Domain role due to an enum conflict
                  // They share the same string values 'OWNER', 'MANAGER', 'STAFF', 'INVITED'
                  final userRoleString = roleAsync.value?.name;
                  final domainRole = userRoleString != null
                      ? RepairShopRole.values.firstWhere(
                          (e) =>
                              e.name.toUpperCase() ==
                              userRoleString.toUpperCase(),
                          orElse: () => RepairShopRole.staff,
                        )
                      : null;

                  ManageWorkshopRoute(
                    shopId: shopId,
                    userRole: domainRole,
                  ).push(context);
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Content
            Expanded(
              child: vehicleListAsync.when(
                data: (vehicles) {
                  // Show empty state if no jobs
                  if (vehicles.isEmpty) {
                    final checklistsAsync = ref.watch(
                      shopChecklistsProvider(shopId),
                    );
                    return checklistsAsync.when(
                      data: (checklists) {
                        if (checklists.isEmpty) {
                          return Consumer(
                            builder: (context, ref, child) {
                              final roleAsync = ref.watch(
                                mechanicDashboardUserRoleProvider(shopId),
                              );
                              return roleAsync.when(
                                data: (role) {
                                  if (role.isOwnerOrManager) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 24.0,
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                ChecklistSelectionRoute(
                                                  shopId: shopId,
                                                ).push(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primary,
                                                shape: const CircleBorder(),
                                                padding: const EdgeInsets.all(
                                                  16,
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: AppColors.textLight,
                                                size: 32,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            '첫 점검표 생성',
                                            style: TextStyle(
                                              color: AppColors.textLight
                                                  .withValues(alpha: 0.7),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return _buildNoJobsView();
                                },
                                loading: () => const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                ),
                                error: (err, stack) => _buildNoJobsView(),
                              );
                            },
                          );
                        }
                        return _buildNoJobsView();
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                      error: (err, stack) => _buildNoJobsView(),
                    );
                  }

                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels >=
                          scrollInfo.metrics.maxScrollExtent - 200) {
                        ref
                            .read(mechanicDashboardViewModelProvider(shopId).notifier)
                            .loadMore();
                      }
                      return false;
                    },
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                        bottom: 160, // pb-40 in design
                      ),
                      itemCount: vehicles.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final job = vehicles[index];
                      return ServiceQueueCard(
                        jobId: job.id,
                        status: job.status,
                        description: job.description,
                        isOpacityReduced:
                            job.status.toUpperCase() == 'CANCELED' ||
                            job.status.toUpperCase() == 'COMPLETED',
                        onTap: () async {
                          if (job.status.toUpperCase() == 'CANCELED') {
                            return; // Canceled jobs do nothing
                          }

                          if (job.status.toUpperCase() == 'WAITING') {
                            await JobChecklistSelectionRoute(
                              shopId: shopId,
                              jobId: job.id,
                            ).push(context);
                            ref.invalidate(mechanicDashboardViewModelProvider(shopId));
                          } else if (job.status.toUpperCase() == 'IN_PROGRESS') {
                            // Call resume API
                            final repository = ref.read(repairJobRepositoryProvider);
                            final result = await repository.resumeJob(jobId: job.id);
                            
                            if (context.mounted) {
                              result.fold(
                                (failure) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('작업을 불러오는데 실패했습니다: ${failure.message}')),
                                  );
                                },
                                (detail) async {
                                  await InspectionDetailsRoute(
                                    jobId: job.id, 
                                    isReadOnly: false, 
                                    $extra: detail,
                                  ).push(context);
                                  ref.invalidate(mechanicDashboardViewModelProvider(shopId));
                                },
                              );
                            }
                          } else if (job.status.toUpperCase() == 'COMPLETED') {
                            // Go to read-only view
                            InspectionDetailsRoute(jobId: job.id, isReadOnly: true).push(context);
                          }
                        },
                      );
                    },
                  ),
                );
              },
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
                error: (err, stack) => Center(
                  child: Text(
                    '오류: $err',
                    style: const TextStyle(color: AppColors.textLight),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoJobsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 80,
            color: AppColors.textLight.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 24),
          Text(
            '아직 작업이 없습니다',
            style: TextStyle(
              color: AppColors.textLight.withValues(alpha: 0.7),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '할당된 작업이 여기에 표시됩니다',
            style: TextStyle(
              color: AppColors.textLight.withValues(alpha: 0.5),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
