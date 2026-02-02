import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../design_system/atoms/app_button.dart';
import '../../../../design_system/atoms/app_input.dart';
import '../../../../design_system/molecules/app_navigation_bar.dart';
import '../../../../design_system/molecules/app_scaffold.dart';
import '../../../../design_system/foundations/app_colors.dart';
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
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    if (newPass != confirmPass) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New passwords do not match')),
      );
      return;
    }

    final userState = ref.read(userNotifierProvider);
    if (!userState.hasValue || userState.value == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('User info not loaded')));
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed: ${failure.message}')),
            );
          },
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password changed successfully')),
            );
            Navigator.pop(context);
          },
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: const AppNavigationBar(title: 'CHANGE PASSWORD'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppInput(
                label: 'Old Password',
                placeholder: 'Enter old password',
                isPassword: true,
                controller: _oldPasswordController,
                enabled: !_isLoading,
              ),
              const SizedBox(height: 16),
              AppInput(
                label: 'New Password',
                placeholder: 'Enter new password',
                isPassword: true,
                controller: _newPasswordController,
                enabled: !_isLoading,
              ),
              const SizedBox(height: 16),
              AppInput(
                label: 'Confirm New Password',
                placeholder: 'Re-enter new password',
                isPassword: true,
                controller: _confirmPasswordController,
                enabled: !_isLoading,
              ),
              const SizedBox(height: 32),
              AppButton(
                text: 'CHANGE PASSWORD',
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
