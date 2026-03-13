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
                      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(text: '내 작업'),
                        Tab(text: '업장 작업'),
                      ],
                    ),
                  ),
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
                body: TabBarView(
                  children: [
                    _MyJobsView(shopId: shopId, jobsAsync: myJobsAsync),
                    _ShopJobsView(shopId: shopId, jobsAsync: shopJobsAsync),
                  ],
                ),
                floatingActionButton: activeIndex == 1
                    ? FloatingActionButton(
                        onPressed: () => SearchHistoryRoute(shopId: shopId).push(context),
                        backgroundColor: AppColors.primary,
                        child: const Icon(Icons.calendar_today, color: Colors.white),
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
                if (jobs.isEmpty) return _buildNoJobsView();
                return RefreshIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.surfaceDark,
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
                      padding: const EdgeInsets.all(16),
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
              error: (err, stack) => Center(child: Text('오류: $err', style: const TextStyle(color: AppColors.textLight))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoJobsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 80, color: AppColors.textLight.withValues(alpha: 0.3)),
          const SizedBox(height: 24),
          const Text('아직 작업이 없습니다', style: TextStyle(color: AppColors.textLight, fontSize: 20, fontWeight: FontWeight.w600)),
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
                if (jobs.isEmpty) return _buildNoJobsView();
                return RefreshIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.surfaceDark,
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
                      padding: const EdgeInsets.all(16),
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
              error: (err, stack) => Center(child: Text('오류: $err', style: const TextStyle(color: AppColors.textLight))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoJobsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_outlined, size: 80, color: AppColors.textLight.withValues(alpha: 0.3)),
          const SizedBox(height: 24),
          const Text('업장에 등록된 작업이 없습니다', style: TextStyle(color: AppColors.textLight, fontSize: 20, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

Future<void> _handleJobTap(BuildContext context, WidgetRef ref, String shopId, dynamic job) async {
  final status = job.status.toUpperCase();
  if (status == 'CANCELED') return;

  if (status == 'WAITING') {
    await JobChecklistSelectionRoute(shopId: shopId, jobId: job.id).push(context);
    ref.invalidate(mechanicDashboardViewModelProvider(shopId));
    ref.invalidate(shopJobsViewModelProvider(shopId));
  } else if (status == 'IN_PROGRESS') {
    final repository = ref.read(repairJobRepositoryProvider);
    final result = await repository.resumeJob(jobId: job.id);
    if (context.mounted) {
      result.fold(
        (failure) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('작업을 불러오는데 실패했습니다: ${failure.message}'))),
        (detail) async {
          await InspectionDetailsRoute(jobId: job.id, isReadOnly: false, $extra: detail).push(context);
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
