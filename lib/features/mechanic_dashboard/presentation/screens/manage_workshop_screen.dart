import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/repair_shop_user.dart';
import '../providers/manage_workshop_view_model.dart';
import '../../../auth/presentation/providers/auth_notifier.dart';
import '../../../dashboard/data/repositories/mechanic_dashboard_repository_impl.dart';
import '../../../dashboard/presentation/providers/dashboard_view_model.dart';

class ManageWorkshopScreen extends ConsumerStatefulWidget {
  final String shopId;

  const ManageWorkshopScreen({super.key, required this.shopId});

  @override
  ConsumerState<ManageWorkshopScreen> createState() =>
      _ManageWorkshopScreenState();
}

class _ManageWorkshopScreenState extends ConsumerState<ManageWorkshopScreen> {
  bool _isLeaving = false;

  Future<void> _handleLeaveWorkshop() async {
    if (_isLeaving) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2f221a),
        title: const Text('사업장 나가기', style: TextStyle(color: Colors.white)),
        content: const Text(
          '정말로 이 사업장을 나가시겠습니까?',
          style: TextStyle(color: Color(0xFFA8A29E)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFF87171),
            ),
            child: const Text('나가기'),
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
            content: Text('사업장 나가기 실패: ${failure.message}'),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      },
      (_) {
        ref.invalidate(dashboardViewModelProvider);
        context.go('/');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('사업장을 성공적으로 나갔습니다'),
            backgroundColor: Color(0xFF22C55E),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final workshopState = ref.watch(
      manageWorkshopViewModelProvider(widget.shopId),
    );

    return AppScaffold(
      appBar: const AppNavigationBar(title: '사업장 관리'),
      body: workshopState.when(
        data: (users) {
          final pendingUsers = users
              .where((u) => u.role == RepairShopRole.invited)
              .toList();
          final activeUsers = users
              .where((u) => u.role != RepairShopRole.invited)
              .toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildInviteButton(),
                const SizedBox(height: 32),
                if (pendingUsers.isNotEmpty) ...[
                  _buildPendingSection(pendingUsers),
                  const SizedBox(height: 32),
                ],
                _buildActiveSection(activeUsers),
                const SizedBox(height: 32),
                _buildLeaveWorkshopButton(),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('오류: $err')),
      ),
    );
  }

  Widget _buildInviteButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.person_add, color: Colors.white),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    '새 멤버 초대',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPendingSection(List<RepairShopUser> users) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            '대기 중인 요청 (${users.length})',
            style: const TextStyle(
              color: Color(0xFFA8A29E),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2f221a),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF292524)),
          ),
          child: Column(
            children: users.asMap().entries.map((entry) {
              final index = entry.key;
              final user = entry.value;
              final isLast = index == users.length - 1;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFF292524), // bg-stone-800
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF374151),
                                ),
                              ),
                              child: const Icon(
                                Icons.hourglass_empty,
                                color: Color(0xFFA8A29E),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                user.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                icon: const Icon(Icons.check),
                                label: const Text('수락'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 60,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFFA8A29E),
                                  side: const BorderSide(
                                    color: Color(0xFF374151),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Icon(Icons.close),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    const Divider(color: Color(0xFF374151), height: 1),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildActiveSection(List<RepairShopUser> users) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Text(
                '활성화된 사업장 멤버',
                style: TextStyle(
                  color: Color(0xFFA8A29E),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Text(
              '총 ${users.length}명',
              style: const TextStyle(
                color: Color(0xFF57534E),
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2f221a),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF292524)),
          ),
          child: Column(
            children: users.asMap().entries.map((entry) {
              final index = entry.key;
              final user = entry.value;
              final isLast = index == users.length - 1;

              return Column(
                children: [
                  _buildUserItem(user),
                  if (!isLast)
                    const Divider(color: Color(0xFF374151), height: 1),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildUserItem(RepairShopUser user) {
    final displayName = user.name.replaceAll(RegExp(r'\s+'), '');
    final initials = displayName.isNotEmpty ? displayName.substring(0, 1) : '?';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: user.role == RepairShopRole.owner
                      ? AppColors.primary
                      : const Color(0xFF374151),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF2f221a), width: 2),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: user.role == RepairShopRole.owner
                          ? Colors.white
                          : const Color(0xFFD6D3D1), // white or stone-300
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (user.userId ==
                            ref.watch(authNotifierProvider).value?.id)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF292524), // bg-stone-800
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color(0xFF44403C),
                              ), // border-stone-700
                            ),
                            child: const Text(
                              '(나)',
                              style: TextStyle(
                                color: Color(0xFF78716C), // text-stone-500
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF374151), // bg-stone-700
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xFF4B5563),
                        ), // border-stone-600
                      ),
                      child: Text(
                        user.role.name.toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFFA8A29E), // text-stone-400
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (user.userId != ref.watch(authNotifierProvider).value?.id) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF292524),
                      foregroundColor: const Color(0xFFD6D3D1),
                      side: const BorderSide(color: Color(0xFF374151)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.edit_square, size: 20),
                    label: const Text('수정'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ref
                          .read(
                            manageWorkshopViewModelProvider(
                              widget.shopId,
                            ).notifier,
                          )
                          .kickUser(user.userId);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0x80292524),
                      foregroundColor: const Color(0xFF78716C),
                      side: const BorderSide(color: Color(0xFF292524)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.person_remove, size: 20),
                    label: const Text('제거'),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLeaveWorkshopButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2f221a),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF292524)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isLeaving ? null : _handleLeaveWorkshop,
          borderRadius: BorderRadius.circular(12),
          hoverColor: const Color(0xFF292524),
          splashColor: const Color(0xFF44403C),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isLeaving)
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Color(0xCCEF4444),
                      strokeWidth: 2,
                    ),
                  )
                else
                  const Icon(Icons.logout, color: Color(0xCCEF4444), size: 24),
                const SizedBox(width: 16),
                const Text(
                  '사업장 나가기',
                  style: TextStyle(
                    color: Color(0xFFF87171),
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

  int min(int a, int b) => a < b ? a : b;
}
