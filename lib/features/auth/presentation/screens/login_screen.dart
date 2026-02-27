import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/router/routes.dart';
import '../../../../design_system/atoms/app_button.dart';
import '../../../../design_system/atoms/app_input.dart';
import '../../../../design_system/molecules/app_scaffold.dart';
import '../../../../design_system/foundations/app_colors.dart';
import '../viewmodels/login_view_model.dart';
import '../providers/auth_notifier.dart';
import '../../domain/entities/user.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Listen to auth state changes and navigate when logged in
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.listen<AsyncValue<User?>>(authNotifierProvider, (previous, next) {
        next.whenData((user) {
          if (user != null && mounted) {
            // User is logged in, navigate to main screen
            const MainRoute().go(context);
          }
        });
      });
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    final phoneNumber = _phoneController.text.trim();
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (phoneNumber.isEmpty || username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '모든 항목을 입력해주세요.',
          ), // "Please fill in all fields" in Korean
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Call login and wait for completion
    await ref
        .read(loginViewModelProvider.notifier)
        .login(
          phoneNumber: phoneNumber,
          username: username,
          password: password,
        );

    // Check result after login completes
    final state = ref.read(loginViewModelProvider);
    if (mounted) {
      state.when(
        data: (_) {
          // Login successful - show success message
          // Navigation is handled by authNotifierProvider listener
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('로그인 성공!')));
        },
        error: (err, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('로그인 실패: $err'),
              backgroundColor: Colors.red,
            ),
          );
        },
        loading: () {},
      );
    }
  }

  void _onSignup() {
    const RegistrationRoute().push(context);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);
    final isLoading = state.isLoading;

    return AppScaffold(
      backgroundColor: const Color(0xFF23170f), // background-dark
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo / Icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.build,
                    color: AppColors.primary,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  '환영합니다',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  '정비사 대시보드',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF999999),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Form
                AppInput(
                  label: '전화번호',
                  placeholder: '010-0000-0000',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  isDarkMode: true,
                  suffixIcon: const Icon(
                    Icons.smartphone,
                    color: AppColors.placeholder,
                  ),
                ),
                const SizedBox(height: 16),
                AppInput(
                  label: '사용자 이름',
                  placeholder: '사용자 이름을 입력하세요',
                  controller: _usernameController,
                  isDarkMode: true,
                ),
                const SizedBox(height: 16),
                AppInput(
                  label: '비밀번호',
                  placeholder: '••••••••',
                  isPassword: true,
                  controller: _passwordController,
                  isDarkMode: true,
                ),
                const SizedBox(height: 32),

                // Buttons
                AppButton(
                  text: '로그인',
                  onPressed: isLoading
                      ? () {}
                      : _onLogin, // Prevent clicks logic handled in AppButton too but explicitly null callback disables styles often
                  isLoading: isLoading,
                ),
                const SizedBox(height: 16),
                AppButton(
                  text: '회원가입',
                  onPressed: isLoading ? () {} : _onSignup,
                  style: AppButtonStyle.secondary,
                ),

                const SizedBox(height: 40),
                const Text(
                  '도움이 필요하신가요? 관리자에게 문의하세요',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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
