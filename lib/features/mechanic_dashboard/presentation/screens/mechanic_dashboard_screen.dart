import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import '../../../../core/router/routes.dart';
import '../providers/mechanic_dashboard_view_model.dart';
import '../widgets/service_queue_card.dart';

class MechanicDashboardScreen extends ConsumerWidget {
  final String shopId;
  final int checklistCount;

  const MechanicDashboardScreen({
    super.key,
    required this.shopId,
    required this.checklistCount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the view model to get job list
    final vehicleListAsync = ref.watch(
      mechanicDashboardViewModelProvider(shopId),
    );

    return AppScaffold(
      backgroundColor: const Color(0xFF23170f), // background-dark
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context),

            // Content
            Expanded(
              child: vehicleListAsync.when(
                data: (vehicles) {
                  // Show empty state if no jobs
                  if (vehicles.isEmpty) {
                    if (checklistCount == 0) {
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            backgroundColor: Colors.orange,
                                            shape: const CircleBorder(),
                                            padding: const EdgeInsets.all(16),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        '첫 점검표 생성',
                                        style: TextStyle(
                                          color: Colors.white.withValues(
                                            alpha: 0.7,
                                          ),
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
                                color: Colors.orange,
                              ),
                            ),
                            error: (err, stack) => _buildNoJobsView(),
                          );
                        },
                      );
                    }
                    return _buildNoJobsView();
                  }

                  return ListView.separated(
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
                        // Example logic for opacity: last item reduced opacity like design
                        isOpacityReduced:
                            index == vehicles.length - 1 && vehicles.length > 3,
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                ),
                error: (err, stack) => Center(
                  child: Text(
                    '오류: $err',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return AppNavigationBar(
      title: '작업 대기열',
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.white, size: 28),
          onPressed: () {
            ManageWorkshopRoute(shopId: shopId).push(context);
          },
        ),
      ],
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
            color: Colors.white.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 24),
          Text(
            '아직 작업이 없습니다',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '할당된 작업이 여기에 표시됩니다',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
