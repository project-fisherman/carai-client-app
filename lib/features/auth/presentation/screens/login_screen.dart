import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/router/routes.dart';
import '../../../../design_system/atoms/app_button.dart';
import '../../../../design_system/atoms/app_input.dart';
import '../../../../design_system/molecules/app_scaffold.dart';
import '../../../../design_system/foundations/app_colors.dart';
import '../viewmodels/login_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    final phoneNumber = _phoneController.text.trim();
    final password = _passwordController.text.trim();

    if (phoneNumber.isEmpty || password.isEmpty) {
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
          password: password,
        );

    // Check result after login completes
    final loginState = ref.read(loginViewModelProvider);
    if (mounted) {
      loginState.when(
        data: (_) {
          // 로그인 성공 시에만 main screen으로 이동
          const MainRoute().go(context);
        },
        error: (err, stack) {
          // Error is handled globally by Dio Interceptor
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
                  textInputAction: TextInputAction.next,
                  isDarkMode: true,
                  suffixIcon: const Icon(
                    Icons.smartphone,
                    color: AppColors.placeholder,
                  ),
                ),
                const SizedBox(height: 16),
                AppInput(
                  label: '비밀번호',
                  placeholder: '••••••••',
                  isPassword: true,
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _onLogin(),
                  isDarkMode: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      const ForgotPasswordRoute().push(context);
                    },
                    child: const Text(
                      '비밀번호 찾기',
                      style: TextStyle(
                        color: AppColors.textSecondaryDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
