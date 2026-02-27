import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../design_system/atoms/app_button.dart';
import '../../../../design_system/molecules/app_navigation_bar.dart';
import '../../../../design_system/molecules/app_scaffold.dart';
import '../../../user/presentation/providers/user_notifier.dart';
import '../../domain/usecases/change_password_usecase.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final oldPass = _oldPasswordController.text;
    final newPass = _newPasswordController.text;
    final confirmPass = _confirmPasswordController.text;

    if (oldPass.isEmpty || newPass.isEmpty || confirmPass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('모든 항목을 입력해주세요')));
      return;
    }

    if (newPass != confirmPass) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('새 비밀번호가 일치하지 않습니다')));
      return;
    }

    final userState = ref.read(userNotifierProvider);
    if (!userState.hasValue || userState.value == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('사용자 정보를 불러오지 못했습니다')));
      return;
    }
    final user = userState.value!;

    setState(() => _isLoading = true);

    try {
      final result = await ref
          .read(changePasswordUseCaseProvider)
          .call(
            phoneNumber: user.phoneNumber,
            username: user.name,
            oldPassword: oldPass,
            newPassword: newPass,
          );

      if (mounted) {
        result.fold(
          (failure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('실패: ${failure.message}')));
          },
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('비밀번호가 성공적으로 변경되었습니다')),
            );
            Navigator.pop(context);
          },
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Widget _buildPasswordField({
    required String label,
    required String placeholder,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xFF999999), fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            enabled: !_isLoading,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFF999999),
                ),
                onPressed: onToggleVisibility,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: const Color(0xFF23170f),
      appBar: const AppNavigationBar(title: '비밀번호 변경'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildPasswordField(
                label: '현재 비밀번호',
                placeholder: '현재 비밀번호를 입력하세요',
                controller: _oldPasswordController,
                obscureText: !_showOldPassword,
                onToggleVisibility: () {
                  setState(() => _showOldPassword = !_showOldPassword);
                },
              ),
              const SizedBox(height: 24),
              _buildPasswordField(
                label: '새 비밀번호',
                placeholder: '새 비밀번호를 입력하세요',
                controller: _newPasswordController,
                obscureText: !_showNewPassword,
                onToggleVisibility: () {
                  setState(() => _showNewPassword = !_showNewPassword);
                },
              ),
              const SizedBox(height: 24),
              _buildPasswordField(
                label: '새 비밀번호 확인',
                placeholder: '새 비밀번호를 다시 입력하세요',
                controller: _confirmPasswordController,
                obscureText: !_showConfirmPassword,
                onToggleVisibility: () {
                  setState(() => _showConfirmPassword = !_showConfirmPassword);
                },
              ),
              const SizedBox(height: 48),
              AppButton(
                text: '비밀번호 변경',
                onPressed: _isLoading ? () {} : _submit,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
