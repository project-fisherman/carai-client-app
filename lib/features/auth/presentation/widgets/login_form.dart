import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../design_system/atoms/app_button.dart';
import '../../../../design_system/atoms/app_input.dart';
import '../../../../design_system/foundations/app_colors.dart';
import '../providers/auth_notifier.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    final phone = _phoneController.text.trim();
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (phone.isNotEmpty && password.isNotEmpty) {
      ref.read(authNotifierProvider.notifier).login(phone, username, password);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('모든 항목을 입력해주세요')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState.isLoading;

    ref.listen(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        error: (message, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('오류: $message'),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppInput(
          label: '전화번호',
          placeholder: '010-0000-0000',
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          suffixIcon: const Icon(
            Icons.smartphone,
            color: AppColors.placeholder,
          ),
        ),
        const SizedBox(height: 20),
        AppInput(
          label: '사용자 이름',
          placeholder: '사용자 이름을 입력하세요',
          controller: _usernameController,
        ),
        const SizedBox(height: 20),
        AppInput(
          label: '비밀번호',
          placeholder: '••••••••',
          isPassword: !_isPasswordVisible,
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.placeholder,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        AppButton(text: '로그인', onPressed: _onLogin, isLoading: isLoading),
        const SizedBox(height: 16),
        AppButton(
          text: '회원가입',
          onPressed: () {},
          style: AppButtonStyle.secondary,
        ),
      ],
    );
  }
}
