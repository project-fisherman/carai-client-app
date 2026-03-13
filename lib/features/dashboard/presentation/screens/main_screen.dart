import 'package:carai/design_system/foundations/app_colors.dart';

import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:carai/features/dashboard/presentation/widgets/add_workshop_card.dart';
import 'package:carai/features/dashboard/presentation/widgets/workshop_card.dart';
import 'package:carai/features/user/presentation/providers/user_notifier.dart';
import 'package:carai/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_view_model.dart';
import '../providers/invitations_view_model.dart';
import '../../data/dtos/mechanic_dashboard_dtos.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.88);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shopsState = ref.watch(dashboardViewModelProvider);
    final userState = ref.watch(userNotifierProvider);

    return AppScaffold(
      backgroundColor: AppColors.backgroundDark, // background-dark
      body: SafeArea(
        child: Column(
          children: [
            // Welcome Section
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Text(
                            '안녕하세요, ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32, // md:text-4xl
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                          userState.when(
                            data: (user) => Text(
                              '${user?.name ?? "정비사"}님.',
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 32, // md:text-4xl
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                            loading: () => const Text(
                              '정비사님.',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 32, // md:text-4xl
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                            error: (error, stackTrace) => const Text(
                              '정비사님.',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 32, // md:text-4xl
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '작업을 확인하려면 사업장을 선택하세요.',
                      style: TextStyle(
                        color: AppColors
                            .textSecondaryDark, // text-slate-500 / dark:text-gray-400
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            const MyPageRoute().push(context);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.account_circle,
                                color: AppColors.textLight,
                                size: 20,
                              ),
                              SizedBox(width: 6),
                              Text(
                                '내 정보',
                                style: TextStyle(
                                  color: AppColors.textLight,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.textLight,
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        ref.watch(invitationsViewModelProvider).when(
                          data: (invites) {
                            if (invites.isEmpty) return const SizedBox.shrink();
                            return _InvitationBadgeButton(invites: invites);
                          },
                          loading: () => const SizedBox.shrink(),
                          error: (_, __) => const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Cards List
            Expanded(
              child: shopsState.when(
                data: (shops) {
                  final shopCards = shops
                      .map(
                        (shop) => WorkshopCard(
                          imagePath:
                              shop.profileImageUrl ??
                              'https://via.placeholder.com/300',
                          workshopName: shop.name,
                          address: shop.address,
                          checklistCount: shop.checklistCount,
                          onTap: () {
                            MechanicDashboardRoute(
                              shopId: shop.id,
                            ).push(context);
                          },
                        ),
                      )
                      .toList();

                  final allCards = <Widget>[
                    ...shopCards,
                    AddWorkshopCard(
                      onTap: () async {
                        await const CreateShopRoute().push(context);
                        // Refresh when back? ViewModel optimistically updates but if we want to force refresh:
                        // ref.read(dashboardViewModelProvider.notifier).refresh();
                      },
                    ),
                  ];

                  return PageView.builder(
                    controller: _pageController, // keep viewportFraction: 0.85
                    itemCount: allCards.length,
                    padEnds:
                        false, // This aligns the first item to the left edge of the PageView
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 24.0 : 8.0,
                          right: 8.0,
                          top: 24.0,
                          bottom: 32.0,
                        ),
                        child: allCards[index],
                      );
                    },
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

            // Pagination Dots
            shopsState.when(
              data: (shops) => Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    shops.length + 1, // +1 for Add Card
                    (index) => _buildDot(isActive: index == _currentPage),
                  ),
                ),
              ),
              loading: () => const SizedBox(),
              error: (error, stackTrace) => const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: isActive ? 24 : 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isActive ? AppColors.primary : AppColors.surfaceDark,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  blurRadius: 10,
                ),
              ]
            : null,
      ),
    );
  }
}

class _InvitationBadgeButton extends ConsumerWidget {
  const _InvitationBadgeButton({required this.invites});

  final List<MyPendingInviteResponseDto> invites;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: () => _showInvitationListDialog(context),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.surfaceDark,
            padding: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(
            Icons.mail_outline,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        Positioned(
          top: -4,
          right: -4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${invites.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showInvitationListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const _InvitationListDialog(),
    );
  }
}

class _InvitationListDialog extends ConsumerWidget {
  const _InvitationListDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invitationsAsync = ref.watch(invitationsViewModelProvider);

    return invitationsAsync.when(
      data: (invites) {
        if (invites.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) Navigator.of(context).pop();
          });
          return const SizedBox.shrink();
        }

        return AlertDialog(
          backgroundColor: AppColors.surfaceDark,
          title: const Text(
            '작업장 초대',
            style: TextStyle(color: Colors.white),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 400),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: invites.length,
                separatorBuilder: (context, index) => const Divider(
                  color: AppColors.inputBackgroundDark,
                  height: 32,
                ),
                itemBuilder: (context, index) {
                  final invite = invites[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Workshop Name
                      Row(
                        children: [
                          const Icon(
                            Icons.storefront,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              invite.repairShop.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Address
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.textSecondaryDark,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              invite.repairShop.address,
                              style: const TextStyle(
                                color: AppColors.textSecondaryDark,
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Inviter (Placeholder as backend doesn't provide name yet)
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            color: AppColors.textSecondaryDark,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '관리자로부터 초대받음', // Placeholder
                            style: TextStyle(
                              color: AppColors.textSecondaryDark,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () async {
                              final notifier = ref.read(invitationsViewModelProvider.notifier);
                              await notifier.reject(invite.repairShopId);
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            ),
                            child: const Text(
                              '거절',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () async {
                              final notifier = ref.read(invitationsViewModelProvider.notifier);
                              await notifier.accept(invite.repairShopId);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              '수락',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => AlertDialog(
        backgroundColor: AppColors.surfaceDark,
        title: const Text('오류', style: TextStyle(color: Colors.white)),
        content: Text('초대 목록을 불러오는 중 오류가 발생했습니다: $err', style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('닫기'),
          ),
        ],
      ),
    );
  }
}

