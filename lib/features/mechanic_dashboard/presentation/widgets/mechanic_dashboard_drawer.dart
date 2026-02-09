import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../dashboard/data/repositories/mechanic_dashboard_repository_impl.dart';
import '../../../dashboard/presentation/providers/dashboard_view_model.dart';

class MechanicDashboardDrawer extends ConsumerStatefulWidget {
  final int shopId;

  const MechanicDashboardDrawer({super.key, required this.shopId});

  @override
  ConsumerState<MechanicDashboardDrawer> createState() =>
      _MechanicDashboardDrawerState();
}

class _MechanicDashboardDrawerState
    extends ConsumerState<MechanicDashboardDrawer> {
  bool _isLeaving = false;

  Future<void> _handleLeaveWorkshop() async {
    if (_isLeaving) return;

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2f221a),
        title: const Text(
          'Leave Workshop',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Are you sure you want to leave this workshop?',
          style: TextStyle(color: Color(0xFFA8A29E)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFF87171),
            ),
            child: const Text('Leave'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() {
      _isLeaving = true;
    });

    final repository = ref.read(mechanicDashboardRepositoryProvider);
    final result = await repository.leaveShop(shopId: widget.shopId);

    if (!mounted) return;

    result.fold(
      (failure) {
        setState(() {
          _isLeaving = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to leave workshop: ${failure.message}'),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      },
      (_) {
        // Success - refresh workshop list and navigate back
        ref.invalidate(dashboardViewModelProvider);

        // Close drawer first
        Navigator.of(context).pop();

        // Navigate back to main screen
        context.go('/');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully left the workshop'),
            backgroundColor: Color(0xFF22C55E),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1a120b), // surface-darker
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: const BoxDecoration(
              color: Color(0xFF2f221a), // surface-dark
              border: Border(
                bottom: BorderSide(color: Color(0xFF292524)),
              ), // border-stone-800
            ),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.garage_outlined, // garage_home
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Admin Console',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        'Workshop Management',
                        style: TextStyle(
                          color: Color(0xFFA8A29E), // text-stone-400
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSectionTitle('Team Administration'),
                const SizedBox(height: 12),
                _buildManageTeamCard(
                  onTap: () {
                    // TODO: Navigate to Team Management screen
                  },
                ),

                const SizedBox(height: 16),
                const Divider(color: Color(0xFF292524), height: 1),
                const SizedBox(height: 16),

                _buildSectionTitle('My Account'),
                const SizedBox(height: 12),
                _buildMenuItem(
                  icon: Icons.account_circle,
                  label: 'View My Profile',
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                _buildMenuItem(
                  icon: Icons.logout,
                  label: 'Leave Workshop',
                  isDestructive: true,
                  onTap: _isLeaving ? null : _handleLeaveWorkshop,
                  isLoading: _isLeaving,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Color(0xFF78716C), // text-stone-500
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildManageTeamCard({required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2f221a), // surface-dark
            Color(0xFF1c1917), // stone-900
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF374151)), // border-stone-700
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.diversity_3,
                    color: AppColors.primary,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Manage Team',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Roles, Invites & Users',
                        style: TextStyle(
                          color: Color(0xFFA8A29E), // text-stone-400
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF78716C),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
    bool isDestructive = false,
    bool isLoading = false,
  }) {
    final textColor = isDestructive
        ? const Color(0xFFF87171)
        : Colors.white; // text-red-400
    final iconColor = isDestructive
        ? const Color(0xCCEF4444)
        : const Color(0xFFA8A29E); // text-red-500/80 : text-stone-400

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2f221a), // surface-dark
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF292524)), // border-stone-800
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          hoverColor: const Color(0xFF292524), // bg-stone-800
          splashColor: const Color(0xFF44403C), // bg-stone-700
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (isLoading)
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: iconColor,
                      strokeWidth: 2,
                    ),
                  )
                else
                  Icon(icon, color: iconColor, size: 24),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
