import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:carai/features/dashboard/presentation/widgets/add_workshop_card.dart';
import 'package:carai/features/dashboard/presentation/widgets/workshop_card.dart';
import 'package:carai/features/user/presentation/providers/user_notifier.dart';
import 'package:carai/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_view_model.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
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
      appBar: AppNavigationBar(
        automaticallyImplyLeading: false,
        titleWidget: Column(
          children: const [
            Text(
              'MECHANICMATE',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'DASHBOARD',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: _buildIconButton(Icons.account_circle),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF23170f), // background-dark
      body: SafeArea(
        child: Column(
          children: [
            // Welcome Section
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome back,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32, // md:text-4xl
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    userState.when(
                      data: (user) => Text(
                        '${user?.name ?? "Mechanic"}.',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 32, // md:text-4xl
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      loading: () => const Text(
                        'Mechanic.',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 32, // md:text-4xl
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      error: (error, stackTrace) => const Text(
                        'Mechanic.',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 32, // md:text-4xl
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Select a workshop to view active jobs.',
                      style: TextStyle(
                        color:
                            Colors.grey, // text-slate-500 / dark:text-gray-400
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
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
                              checklistCount: shop.checklistCount,
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
                    controller: _pageController,
                    itemCount: allCards.length,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 32.0,
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
                    'Error: $err',
                    style: const TextStyle(color: Colors.white),
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

  Widget _buildIconButton(IconData icon) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.account_circle) {
          const MyPageRoute().push(context);
        }
      },
      child: Container(
        width: 56,
        height: 56,
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.white, size: 32),
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
        color: isActive ? AppColors.primary : Colors.grey[700],
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
