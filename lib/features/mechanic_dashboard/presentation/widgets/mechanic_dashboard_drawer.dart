import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:flutter/material.dart';

class MechanicDashboardDrawer extends StatelessWidget {
  const MechanicDashboardDrawer({super.key});

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
                _buildSectionTitle('User Management'),
                const SizedBox(height: 12),
                _buildMenuItem(
                  icon: Icons.manage_accounts,
                  label: 'Modify User Role',
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                _buildMenuItem(
                  icon: Icons.person_remove,
                  label: 'Remove User',
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                _buildMenuItem(
                  icon: Icons.group,
                  label: 'View Users',
                  onTap: () {},
                ),

                const SizedBox(height: 16),
                const Divider(
                  color: Color(0xFF292524),
                  height: 1,
                ), // border-stone-800
                const SizedBox(height: 16),

                _buildSectionTitle('Invitations'),
                const SizedBox(height: 12),
                _buildMenuItem(
                  icon: Icons.person_add,
                  label: 'Invite User',
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                _buildMenuItem(
                  icon: Icons.mark_email_read,
                  label: 'Accept Invite',
                  onTap: () {},
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
                  onTap: () {},
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

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isDestructive = false,
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
