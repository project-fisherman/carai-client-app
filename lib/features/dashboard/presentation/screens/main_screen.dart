import 'package:carai/design_system/foundations/app_colors.dart';

import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:carai/features/dashboard/presentation/widgets/add_workshop_card.dart';
import 'package:carai/features/dashboard/presentation/widgets/workshop_card.dart';
import 'package:carai/features/user/presentation/providers/user_notifier.dart';
import 'package:carai/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_view_model.dart';
import '../../../mechanic_dashboard/presentation/providers/invitation_provider.dart';

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
                    Row(
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
                        if (ref.watch(isInvitationPendingProvider).value ?? false)
                          _InvitationBadgeButton(),
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: () => _showInvitationDialog(context, ref),
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
        Position81(
          top: -4,
          right: -4,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.priority_high,
              color: Colors.white,
              size: 10,
            ),
          ),
        ),
      ],
    );
  }

  void _showInvitationDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceDark,
        title: const Text(
          '새로운 초대',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          '새로운 업장 초대장이 도착했습니다.\n수락하시겠습니까?',
          style: TextStyle(color: AppColors.textSecondaryDark),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('나중에', style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(invitationActionProvider.notifier).acceptInvitation();
              // Refresh shops list
              ref.read(dashboardViewModelProvider.notifier).refresh();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: const Text('수락하기'),
          ),
        ],
      ),
    );
  }
}

class Position81 extends StatelessWidget {
  final double? top;
  final double? right;
  final Widget child;

  const Position81({
    super.key,
    this.top,
    this.right,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: child,
    );
  }
}
