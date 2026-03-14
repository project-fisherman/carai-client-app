import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/router/routes.dart';
import '../../domain/entities/repair_shop_user.dart';
import '../../data/dtos/repair_job_dtos.dart';
import '../providers/mechanic_dashboard_view_model.dart';
import '../providers/shop_jobs_view_model.dart';
import '../providers/checklist_management_view_model.dart';
import '../../data/repositories/repair_job_repository_impl.dart';
import '../widgets/service_queue_card.dart';

class MechanicDashboardScreen extends ConsumerWidget {
  final String shopId;

  const MechanicDashboardScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 외부 화면(AiReportScreen 등)에서 보낸 새로고침 시그널 감지
    ref.listen(dashboardRefreshSignalProvider, (_, __) {
      ref.invalidate(mechanicDashboardViewModelProvider(shopId));
      ref.invalidate(shopJobsViewModelProvider(shopId));
    });

    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);
          
          return ListenableBuilder(
            listenable: tabController,
            builder: (context, _) {
              final activeIndex = tabController.index;
              
              // Watch the view models
              final myJobsAsync = ref.watch(mechanicDashboardViewModelProvider(shopId));
              final shopJobsAsync = ref.watch(shopJobsViewModelProvider(shopId));

              return AppScaffold(
                backgroundColor: AppColors.backgroundDark,
                appBar: AppNavigationBar(
                  title: '', // 타이틀 제거
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(48),
                    child: TabBar(
                      indicatorColor: AppColors.primary,
                      indicatorWeight: 3,
                      labelColor: AppColors.primary,
                      unselectedLabelColor: AppColors.textSecondaryDark,
                      labelStyle: const TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                      tabs: const [
                        Tab(text: '내 작업'),
                        Tab(text: '업장 작업'),
                      ],
                    ),
                  ),
                  actions: [
                    // Profile Button (Right)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final roleAsync = ref.watch(
                            mechanicDashboardUserRoleProvider(shopId),
                          );
                          return IconButton(
                            icon: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.surfaceDark,
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  width: 1,
                                ),
                              ),
                              child: const Icon(
                                Icons.person_rounded,
                                color: AppColors.primary,
                                size: 20,
                              ),
                            ),
                            onPressed: () {
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
                    ),
                  ],
                ),
                body: TabBarView(
                  children: [
                    _MyJobsView(shopId: shopId, jobsAsync: myJobsAsync),
                    _ShopJobsView(shopId: shopId, jobsAsync: shopJobsAsync),
                  ],
                ),
                floatingActionButton: activeIndex == 1
                    ? FloatingActionButton.extended(
                        onPressed: () => SearchHistoryRoute(shopId: shopId).push(context),
                        backgroundColor: AppColors.primary,
                        elevation: 4,
                        icon: const Icon(Icons.history_rounded, color: Colors.white, size: 20),
                        label: const Text(
                          '히스토리',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}

class _MyJobsView extends ConsumerWidget {
  final String shopId;
  final AsyncValue<List<dynamic>> jobsAsync;

  const _MyJobsView({required this.shopId, required this.jobsAsync});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: jobsAsync.when(
              data: (jobs) {
                if (jobs.isEmpty) return _buildNoJobsView(context);
                return RefreshIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.surfaceDark,
                  displacement: 20,
                  onRefresh: () async {
                    ref.invalidate(mechanicDashboardViewModelProvider(shopId));
                    await ref.read(mechanicDashboardViewModelProvider(shopId).future);
                  },
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels >=
                          scrollInfo.metrics.maxScrollExtent - 200) {
                        ref.read(mechanicDashboardViewModelProvider(shopId).notifier).loadMore();
                      }
                      return false;
                    },
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                      itemCount: jobs.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final job = jobs[index];
                        return ServiceQueueCard(
                          jobId: job.id,
                          status: job.status,
                          description: job.description,
                          customerName: job.customerName,
                          carNumber: job.carNumber,
                          carModelCode: job.carModelCode,
                          isOpacityReduced: job.status.toUpperCase() == 'CANCELED',
                          onTap: () => _handleJobTap(context, ref, shopId, job),
                        );
                      },
                    ),
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
              error: (err, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 48),
                    const SizedBox(height: 16),
                    Text('데이터를 불러오지 못했습니다\n$err', 
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.textSecondaryDark)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoJobsView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surfaceDark,
            ),
            child: const Icon(
              Icons.assignment_turned_in_rounded, 
              size: 48, 
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '할당된 작업이 없습니다.',
            style: TextStyle(
              color: Colors.white, 
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ShopJobsView extends ConsumerWidget {
  final String shopId;
  final AsyncValue<List<RepairJobResponseDto>> jobsAsync;

  const _ShopJobsView({required this.shopId, required this.jobsAsync});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: jobsAsync.when(
              data: (jobs) {
                if (jobs.isEmpty) return _buildNoJobsView(context);
                return RefreshIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.surfaceDark,
                  displacement: 20,
                  onRefresh: () async {
                    ref.invalidate(shopJobsViewModelProvider(shopId));
                    await ref.read(shopJobsViewModelProvider(shopId).future);
                  },
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels >=
                          scrollInfo.metrics.maxScrollExtent - 200) {
                        ref.read(shopJobsViewModelProvider(shopId).notifier).loadMore(shopId);
                      }
                      return false;
                    },
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                      itemCount: jobs.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final job = jobs[index];
                        return ServiceQueueCard(
                          jobId: job.id,
                          status: job.status,
                          description: job.description,
                          customerName: job.intakeSummary?.customerName ?? '',
                          carNumber: job.intakeSummary?.carNumber ?? '',
                          carModelCode: job.intakeSummary?.carModelCode ?? '',
                          isOpacityReduced: job.status.toUpperCase() == 'CANCELED',
                          onTap: () => _handleJobTap(context, ref, shopId, job),
                        );
                      },
                    ),
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
              error: (err, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 48),
                    const SizedBox(height: 16),
                    Text('데이터를 불러오지 못했습니다\n$err',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.textSecondaryDark)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoJobsView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surfaceDark,
            ),
            child: const Icon(
              Icons.search_off_rounded, 
              size: 48, 
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '등록된 작업이 없습니다.',
            style: TextStyle(
              color: Colors.white, 
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _handleJobTap(BuildContext context, WidgetRef ref, String shopId, dynamic job) async {
  final status = job.status.toUpperCase();
  if (status == 'CANCELED') return;

  if (status == 'WAITING') {
    // Check if there are registered checklists before proceeding
    try {
      final checklists = await ref.read(shopChecklistsProvider(shopId).future);

      if (checklists.isEmpty) {
        if (context.mounted) {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: const Color(0xFF2C2A28),
              title: const Text(
                '등록된 점검표 없음',
                style: TextStyle(color: Colors.white),
              ),
              content: const Text(
                '작업을 시작하려면 먼저 점검표를 등록해야 합니다.\n점검표 관리 페이지로 이동하시겠습니까?',
                style: TextStyle(color: Colors.white70),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('취소', style: TextStyle(color: Colors.white54)),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    '이동',
                    style: TextStyle(color: Color(0xFFE65100)),
                  ),
                ),
              ],
            ),
          );

          if (confirm == true && context.mounted) {
            ChecklistManagementRoute(shopId: shopId).push(context);
          }
        }
        return;
      }

      if (context.mounted) {
        await JobChecklistSelectionRoute(
          shopId: shopId,
          jobId: job.id,
        ).push(context);
        ref.invalidate(mechanicDashboardViewModelProvider(shopId));
        ref.invalidate(shopJobsViewModelProvider(shopId));
      }
    } catch (e) {
      // Error is handled globally by Dio Interceptor
    }
  } else if (status == 'IN_PROGRESS') {
    final repository = ref.read(repairJobRepositoryProvider);
    final result = await repository.resumeJob(jobId: job.id);
    if (context.mounted) {
      result.fold(
        (failure) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('작업을 불러오는데 실패했습니다: ${failure.message}')),
        ),
        (detail) async {
          await InspectionDetailsRoute(
            jobId: job.id,
            isReadOnly: false,
            $extra: detail,
          ).push(context);
          if (context.mounted) {
            ref.invalidate(mechanicDashboardViewModelProvider(shopId));
            ref.invalidate(shopJobsViewModelProvider(shopId));
          }
        },
      );
    }
  } else if (['COMPLETED', 'REPORT_GENERATING', 'REPORT_COMPLETED', 'REPORT_FAILED'].contains(status)) {
    await AiReportRoute(jobId: job.id).push(context);
    if (context.mounted) {
      ref.invalidate(mechanicDashboardViewModelProvider(shopId));
      ref.invalidate(shopJobsViewModelProvider(shopId));
    }
  }
}
