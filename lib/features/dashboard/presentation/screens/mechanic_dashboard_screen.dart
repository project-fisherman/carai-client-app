import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/features/dashboard/presentation/widgets/add_workshop_card.dart';
import 'package:carai/features/dashboard/presentation/widgets/workshop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MechanicDashboardScreen extends ConsumerWidget {
  const MechanicDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF23170f), // background-dark
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconButton(Icons.menu),
                  Column(
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
                  _buildIconButton(Icons.account_circle),
                ],
              ),
            ),

            // Welcome Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome back,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32, // md:text-4xl
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    Text(
                      'Mechanic.',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 32, // md:text-4xl
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                children: [
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
                ],
              ),
            ),

            // Pagination Dots
            Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(isActive: true),
                  _buildDot(isActive: false),
                  _buildDot(isActive: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: Colors.white, size: 32),
    );
  }

  Widget _buildDot({required bool isActive}) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
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
