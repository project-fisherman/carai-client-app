import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:carai/features/dashboard/presentation/widgets/add_workshop_card.dart';
import 'package:carai/features/dashboard/presentation/widgets/workshop_card.dart';
import 'package:carai/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MechanicDashboardScreen extends ConsumerStatefulWidget {
  const MechanicDashboardScreen({super.key});

  @override
  ConsumerState<MechanicDashboardScreen> createState() =>
      _MechanicDashboardScreenState();
}

class _MechanicDashboardScreenState
    extends ConsumerState<MechanicDashboardScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  final List<Widget> _dashboardCards = [
    const WorkshopCard(
      imagePath:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuADDutPxMTr1hLNgfBEzx-fsQ6rkxICovsTvlYTmv39n3G9NJP7J037G8_03f_5kPdezfMQOlLepmqrVnANcEXNQHDjvUHsgTbhNHHEP-17dFV98J6cDPPaac_lsGvfTg4iSRCyjMFLSHCU5Tos1WXRr-xAqkZ4VmjYtDuBjHvJqDVwmCMhIyghbEQZir8tjVbcvoL9sQqHD-rp7Mb1FEQgqKnQSL9itEeb_KONcGcaZ50VuirDxirVv7duRXzLFATLKsEZGFI7L1Q5',
      workshopName: 'Downtown Garage',
      address: '123 Main St, Sector 4',
      jobCount: 4,
    ),
    const WorkshopCard(
      imagePath:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBbIJhitV-Pf6wIgt2FD9p2nR4Zt35fLpRP40sgm93r1nrWYLy985BZRo-NeGFw2mD4o4IZtib_8FR_DGk-lHsQpC_KP1C2DxMA8AmpxhY7XSgkfVPfyybqC3i9LUdOFCJ8ZkQzfbv5hH0pVHHmswuCAtZFDnR5aKPfza8CLwwkAB1kpnlsFDOPEJvbDM1eZ-Ir0CJO44BlHlC0KWP-BSYE7HdUWNxkNbFmkEiEyHQd4J7lOk2sLppEsVHKBt5rYD3ZOVv_IgwsIsbh',
      workshopName: 'Northside Quick Lube',
      address: '89 North Ave',
      jobCount: 1,
    ),
    AddWorkshopCard(
      onTap: () {
        // Handle add workshop tap
      },
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppNavigationBar(
        leading: Center(child: _buildIconButton(Icons.menu)),
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
                    const Text(
                      'Mechanic.',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 32, // md:text-4xl
                        fontWeight: FontWeight.bold,
                        height: 1.1,
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
              child: PageView.builder(
                controller: _pageController,
                itemCount: _dashboardCards.length,
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
                    child: _dashboardCards[index],
                  );
                },
              ),
            ),

            // Pagination Dots
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _dashboardCards.length,
                  (index) => _buildDot(isActive: index == _currentPage),
                ),
              ),
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
