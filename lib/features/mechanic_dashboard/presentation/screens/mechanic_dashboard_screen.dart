import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/mechanic_dashboard_view_model.dart';
import '../widgets/mechanic_dashboard_drawer.dart';
import '../widgets/service_queue_card.dart';

class MechanicDashboardScreen extends ConsumerWidget {
  final int shopId;

  const MechanicDashboardScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the view model to get vehicle list
    final vehicleListAsync = ref.watch(
      mechanicDashboardViewModelProvider(shopId),
    );

    return AppScaffold(
      // Pass endDrawer to AppScaffold to make it appear from right
      endDrawer: const MechanicDashboardDrawer(),
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
                      final vehicle = vehicles[index];
                      return ServiceQueueCard(
                        year: vehicle.year,
                        make: vehicle.make,
                        model: vehicle.model,
                        ownerName: vehicle.ownerName,
                        licensePlate: vehicle.licensePlate,
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
}
