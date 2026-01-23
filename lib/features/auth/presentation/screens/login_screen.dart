import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/routes.dart';
import '../../../../design_system/atoms/app_button.dart';
import '../../../../design_system/atoms/app_input.dart';
import '../../../../design_system/foundations/app_colors.dart';
import '../viewmodels/login_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isAutoLogin = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    ref
        .read(loginViewModelProvider.notifier)
        .login(
          phoneNumber: _phoneController.text,
          username: _usernameController.text,
          password: _passwordController.text,
        );
  }

  void _onSignup() {
    const RegistrationRoute().push(context);
  }

  @override
  Widget build(BuildContext context) {
    // Listen to state changes
    ref.listen(loginViewModelProvider, (previous, next) {
      next.when(
        data: (_) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login Successful!')));
          // Navigate to home or dashboard
          context.go('/home'); // Example route
        },
        error: (err, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Failed: $err'),
              backgroundColor: Colors.red,
            ),
          );
        },
        loading: () {},
      );
    });

    final state = ref.watch(loginViewModelProvider);
    final isLoading = state.isLoading;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
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
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Mechanic Dashboard',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Form
                AppInput(
                  label: 'Phone number',
                  placeholder: '(555) 000-0000',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  suffixIcon: const Icon(
                    Icons.smartphone,
                    color: AppColors.placeholder,
                  ),
                ),
                const SizedBox(height: 16),
                AppInput(
                  label: 'Username',
                  placeholder: 'Enter username',
                  controller: _usernameController,
                ),
                const SizedBox(height: 16),
                AppInput(
                  label: 'Password',
                  placeholder: '••••••••',
                  isPassword: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),

                // Auto-login Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _isAutoLogin,
                      activeColor: AppColors.primary,
                      onChanged: (val) {
                        setState(() {
                          _isAutoLogin = val ?? false;
                        });
                      },
                    ),
                    const Text(
                      'Auto-login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Buttons
                AppButton(
                  text: 'LOG IN',
                  onPressed: isLoading
                      ? () {}
                      : _onLogin, // Prevent clicks logic handled in AppButton too but explicitly null callback disables styles often
                  isLoading: isLoading,
                ),
                const SizedBox(height: 16),
                AppButton(
                  text: 'SIGN UP',
                  onPressed: isLoading ? () {} : _onSignup,
                  style: AppButtonStyle.secondary,
                ),

                const SizedBox(height: 40),
                const Text(
                  'Need help? Contact Supervisor',
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
