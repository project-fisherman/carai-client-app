import 'package:carai/design_system/atoms/app_button.dart';
import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:carai/features/auth/presentation/providers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../user/presentation/providers/user_notifier.dart';
import '../../../user/presentation/widgets/edit_username_sheet.dart';
import '../../../../core/router/routes.dart';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch user state
    final userState = ref.watch(userNotifierProvider);

    return AppScaffold(
      backgroundColor: const Color(0xFF23170f), // background-dark
      appBar: const AppNavigationBar(title: '마이페이지'),
      body: SafeArea(
        child: userState.when(
          data: (user) {
            if (user == null) {
              return const Center(
                child: Text(
                  '사용자를 찾을 수 없습니다',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Info
                  _buildProfileItem(
                    label: '사용자 이름',
                    value: user.name,
                    onEdit: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) =>
                            EditUsernameSheet(initialName: user.name),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildProfileItem(
                    label: '전화번호',
                    value: user.phoneNumber,
                    // Phone number not editable
                  ),
                  const SizedBox(height: 48),

                  // Actions
                  AppButton(
                    text: '비밀번호 변경',
                    onPressed: () {
                      const ChangePasswordRoute().push(context);
                    },
                    // Using a different style or default? Default is primary.
                    // Maybe we want a cleaner look for secondary actions?
                    // Let's use primary for now as it's an important action.
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    text: '로그아웃',
                    onPressed: () async {
                      await ref.read(authNotifierProvider.notifier).logout();
                      // Navigation handled by auth listener usually, or we do it manually?
                      // AuthNotifier likely triggers state change which router listens to.
                      // If not, we might need manual navigation.
                      // Let's assume AuthNotifier handles state and router redirects.
                      // Checking AuthNotifier...
                    },
                    style: AppButtonStyle.secondary,
                  ),
                ],
              ),
            );
          },
          error: (err, stack) => Center(
            child: Text(
              '오류: $err',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required String label,
    required String value,
    VoidCallback? onEdit,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF999999), // placeholder color or similar
                fontSize: 14,
              ),
            ),
            if (onEdit != null)
              GestureDetector(
                onTap: onEdit,
                child: const Text(
                  '수정',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C), // Slightly lighter than bg
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
