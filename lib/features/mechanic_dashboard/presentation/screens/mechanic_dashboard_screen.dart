import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/mechanic_dashboard_view_model.dart';
import '../widgets/mechanic_dashboard_drawer.dart';
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
      // Pass endDrawer to AppScaffold to make it appear from right
      endDrawer: MechanicDashboardDrawer(shopId: shopId),
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
                          final roleAsync = ref.watch(userRoleProvider(shopId));
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
                                            // TODO: Navigate to create checklist or similar action
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
                                        'Create First Checklist',
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
                    'Error: $err',
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
    // Design: sticky header with blur.
    // In Flutter, we can use a Container. For sticky behavior in a ScrollView, we'd use Slivers,
    // but here we have a fixed header above the list, which is simpler and robust.

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(
          0xFF23170f,
        ).withValues(alpha: 0.95), // bg-background-dark/95
        border: const Border(
          bottom: BorderSide(color: Color(0xFF292524)), // border-stone-800
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button (Left)
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          // Title (Center)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Service Queue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800, // extrabold
                    letterSpacing: -0.5, // tracking-tight
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  DateFormat('MMM dd, yyyy').format(DateTime.now()),
                  style: TextStyle(
                    color: Color(0xFFA8A29E), // text-stone-400
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Hamburger Menu Button (Right)
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
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
          Icon(
            Icons.inbox_outlined,
            size: 80,
            color: Colors.white.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 24),
          Text(
            'No Jobs Yet',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Jobs will appear here when assigned',
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
