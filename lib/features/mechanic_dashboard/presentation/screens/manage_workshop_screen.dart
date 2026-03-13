import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/routes.dart';
import '../../domain/entities/repair_shop_user.dart';
import '../providers/manage_workshop_view_model.dart';
import '../../../auth/presentation/providers/auth_notifier.dart';
import '../../../dashboard/data/repositories/mechanic_dashboard_repository_impl.dart';
import '../../../dashboard/presentation/providers/dashboard_view_model.dart';

class ManageWorkshopScreen extends ConsumerStatefulWidget {
  final String shopId;
  final RepairShopRole? userRole;

  const ManageWorkshopScreen({super.key, required this.shopId, this.userRole});

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
        backgroundColor: AppColors.surfaceDark,
        title: const Text('사업장 나가기', style: TextStyle(color: Colors.white)),
        content: const Text(
          '정말로 이 사업장을 나가시겠습니까?',
          style: TextStyle(color: AppColors.textSecondaryDark),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
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

  Future<void> _showInviteDialog() async {
    final phoneController = TextEditingController();
    final inviteToken = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceDark,
        title: const Text('새 멤버 초대', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '초대할 멤버의 휴대폰 번호를 입력해주세요.',
              style: TextStyle(color: AppColors.textSecondaryDark),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: '010-0000-0000',
                hintStyle: TextStyle(color: AppColors.textSecondaryDark),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.backgroundDark),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () async {
              final phoneNumber = phoneController.text.trim();
              if (phoneNumber.isEmpty) return;

              try {
                final token = await ref
                    .read(manageWorkshopViewModelProvider(widget.shopId).notifier)
                    .inviteUser(phoneNumber);
                if (context.mounted) Navigator.of(context).pop(token);
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('초대 실패: ${e.toString()}'),
                      backgroundColor: const Color(0xFFEF4444),
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: const Text(
              '초대하기',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    if (inviteToken != null && mounted) {
      final inviteUrl = 'https://carai.app/invites/$inviteToken';
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.surfaceDark,
          title: const Text('초대 링크 생성됨', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '아래 링크를 복사하여 초대할 분에게 전달해주세요.',
                style: TextStyle(color: AppColors.textSecondaryDark),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.backgroundDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SelectableText(
                        inviteUrl,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: inviteUrl));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('링크가 클립보드에 복사되었습니다.'),
                            backgroundColor: AppColors.primary,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.content_copy,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      tooltip: '복사하기',
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('닫기'),
            ),
          ],
        ),
      );
    }
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

          return RefreshIndicator(
            color: AppColors.primary,
            backgroundColor: AppColors.surfaceDark,
            onRefresh: () async {
              ref.invalidate(manageWorkshopViewModelProvider(widget.shopId));
              await ref.read(manageWorkshopViewModelProvider(widget.shopId).future);
            },
            child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                Builder(
                  builder: (context) {
                    if (widget.userRole == RepairShopRole.owner ||
                        widget.userRole == RepairShopRole.manager) {
                      return Column(
                        children: [
                          _buildManageChecklistButton(),
                          const SizedBox(height: 32),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                _buildLeaveWorkshopButton(),
                const SizedBox(height: 100),
              ],
            ),
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
          onTap: _showInviteDialog,
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
              color: AppColors.textSecondaryDark,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.backgroundDark),
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
                                color: AppColors.backgroundDark, // bg-stone-800
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.surfaceDark,
                                ),
                              ),
                              child: const Icon(
                                Icons.hourglass_empty,
                                color: AppColors.textSecondaryDark,
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
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  final confirmed = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor: AppColors.surfaceDark,
                                      title: const Text(
                                        '초대 취소',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      content: const Text(
                                        '이 초대를 취소하시겠습니까?',
                                        style: TextStyle(
                                          color: AppColors.textSecondaryDark,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text('아니오'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.redAccent,
                                          ),
                                          child: const Text('예, 취소합니다'),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (confirmed == true) {
                                    ref
                                        .read(
                                          manageWorkshopViewModelProvider(
                                            widget.shopId,
                                          ).notifier,
                                        )
                                        .cancelInvitation(user.userId);
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: AppColors.backgroundDark,
                                  foregroundColor: AppColors.textSecondaryDark,
                                  side: const BorderSide(
                                    color: AppColors.surfaceDark,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                icon: const Icon(Icons.close, size: 18),
                                label: const Text('초대 취소'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    const Divider(color: AppColors.backgroundDark, height: 1),
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
                  color: AppColors.textSecondaryDark,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Text(
              '총 ${users.length}명',
              style: const TextStyle(
                color: AppColors.textSecondaryDark,
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.backgroundDark),
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
                    const Divider(color: AppColors.backgroundDark, height: 1),
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
                      : AppColors.backgroundDark,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surfaceDark, width: 2),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: user.role == RepairShopRole.owner
                          ? Colors.white
                          : AppColors.textSecondaryDark,
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
                              color: AppColors.surfaceDark, // bg-stone-800
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppColors.backgroundDark,
                              ), // border-stone-700
                            ),
                            child: const Text(
                              '(나)',
                              style: TextStyle(
                                color: AppColors.textSecondaryDark, // text-stone-500
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
                        color: AppColors.backgroundDark, // bg-stone-700
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppColors.surfaceDark,
                        ), // border-stone-600
                      ),
                      child: Text(
                        user.role.label,
                        style: const TextStyle(
                          color: AppColors.textSecondaryDark, // text-stone-400
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
                        backgroundColor: AppColors.backgroundDark,
                        foregroundColor: AppColors.textSecondaryDark,
                        side: const BorderSide(color: AppColors.surfaceDark),
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
                        backgroundColor: AppColors.surfaceDark,
                        foregroundColor: AppColors.textSecondaryDark,
                        side: const BorderSide(color: AppColors.backgroundDark),
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

  Widget _buildManageChecklistButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFF9800), // Slightly warmer orange
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ChecklistManagementRoute(shopId: widget.shopId).push(context);
          },
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
                  child: const Icon(Icons.settings, color: Colors.white),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    '점검표 관리',
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

  Widget _buildLeaveWorkshopButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.backgroundDark),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isLeaving ? null : _handleLeaveWorkshop,
          borderRadius: BorderRadius.circular(12),
          hoverColor: AppColors.backgroundDark,
          splashColor: AppColors.surfaceDark,
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
                      color: Colors.redAccent,
                      strokeWidth: 2,
                    ),
                  )
                else
                  const Icon(Icons.logout, color: Colors.redAccent, size: 24),
                const SizedBox(width: 16),
                const Text(
                  '사업장 나가기',
                  style: TextStyle(
                    color: Colors.redAccent,
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
