import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../design_system/atoms/app_button.dart';
import '../../../../design_system/atoms/app_input.dart';
import '../../../../design_system/molecules/app_scaffold.dart';
import '../../../../design_system/foundations/app_colors.dart';
import '../viewmodels/forgot_password_view_model.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    for (var c in _otpControllers) {
      c.dispose();
    }
    for (var f in _otpFocusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onSendSms() {
    if (ref.read(forgotPasswordViewModelProvider).isLoading) return;

    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('전화번호를 입력해주세요')));
      return;
    }
    if (_usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('사용자 이름을 입력해주세요')));
      return;
    }

    // Clear OTP fields when resending
    for (var controller in _otpControllers) {
      controller.clear();
    }
    _otpFocusNodes[0].requestFocus();

    ref
        .read(forgotPasswordViewModelProvider.notifier)
        .sendSmsCode(_phoneController.text);
  }

  void _onVerify() {
    final smsCode = _otpControllers.map((e) => e.text).join();
    if (smsCode.length != 6) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('올바른 6자리 인증번호를 입력해주세요')));
      return;
    }
    ref.read(forgotPasswordViewModelProvider.notifier).verifySmsCode(
          phoneNumber: _phoneController.text,
          smsCode: smsCode,
        );
  }

  void _onResetPassword() {
    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('새 비밀번호를 입력해주세요')));
      return;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('비밀번호가 일치하지 않습니다')));
      return;
    }
    ref.read(forgotPasswordViewModelProvider.notifier).resetPassword(
          phoneNumber: _phoneController.text,
          username: _usernameController.text,
          newPassword: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(forgotPasswordViewModelProvider, (previous, next) {
      if (next.isResetComplete && previous?.isResetComplete != true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('비밀번호가 변경되었습니다. 로그인해주세요.')),
        );
        Navigator.of(context).pop();
      }
    });

    final state = ref.watch(forgotPasswordViewModelProvider);
    final isLoading = state.isLoading;
    final isSmsSent = state.isSmsSent;
    final isVerified = state.isVerified;
    final remainingTime = state.remainingTime;
    final resendCooldown = state.resendCooldown;

    return AppScaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.textLight),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: const Icon(
                    Icons.lock_reset,
                    color: AppColors.primary,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '비밀번호 찾기',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textLight,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                '가입 시 등록한 전화번호와 이름으로\n본인 인증 후 비밀번호를 재설정합니다.',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondaryDark,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Step 1: Phone + Username
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    AppInput(
                      label: '사용자 이름',
                      placeholder: '가입 시 등록한 이름',
                      controller: _usernameController,
                      keyboardType: TextInputType.name,
                      isDarkMode: true,
                      enabled: !isVerified,
                      suffixIcon: const Icon(
                        Icons.person,
                        color: AppColors.placeholder,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppInput(
                      label: '휴대전화 번호',
                      placeholder: '010-0000-0000',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      isDarkMode: true,
                      enabled: !isVerified,
                      suffixIcon: const Icon(
                        Icons.smartphone,
                        color: AppColors.placeholder,
                      ),
                    ),
                    if (!isSmsSent) ...[
                      const SizedBox(height: 24),
                      AppButton(
                        text: '인증번호 전송',
                        onPressed: isLoading ? () {} : _onSendSms,
                        isLoading: isLoading && !isSmsSent,
                      ),
                    ],
                  ],
                ),
              ),

              if (isSmsSent) ...[
                const SizedBox(height: 32),
                const Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.surfaceDark)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "본인 인증",
                        style: TextStyle(
                          color: AppColors.textSecondaryDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.surfaceDark)),
                  ],
                ),
                const SizedBox(height: 32),

                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "인증번호 입력",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textLight,
                            ),
                          ),
                          Row(
                            children: [
                              if (remainingTime > 0)
                                Text(
                                  "${remainingTime}s",
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              TextButton(
                                onPressed: (isVerified ||
                                        isLoading ||
                                        resendCooldown > 0)
                                    ? null
                                    : _onSendSms,
                                child: Text(
                                  resendCooldown > 0
                                      ? "재전송 (${resendCooldown}s)"
                                      : "재전송",
                                  style: TextStyle(
                                    color: (isVerified ||
                                            isLoading ||
                                            resendCooldown > 0)
                                        ? AppColors.textSecondaryDark
                                        : AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          6,
                          (index) => _buildOtpDigit(index),
                        ),
                      ),
                      const SizedBox(height: 24),

                      if (!isVerified)
                        AppButton(
                          text: '인증하기',
                          onPressed: isLoading ? () {} : _onVerify,
                          isLoading: isLoading,
                        ),

                      if (isVerified) ...[
                        const SizedBox(height: 24),
                        const Divider(color: AppColors.backgroundDark),
                        const SizedBox(height: 24),
                        AppInput(
                          label: '새 비밀번호',
                          placeholder: '••••••••',
                          isPassword: true,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          isDarkMode: true,
                        ),
                        const SizedBox(height: 16),
                        AppInput(
                          label: '새 비밀번호 확인',
                          placeholder: '••••••••',
                          isPassword: true,
                          controller: _confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          isDarkMode: true,
                        ),
                        const SizedBox(height: 32),
                        AppButton(
                          text: '비밀번호 재설정',
                          onPressed: isLoading ? () {} : _onResetPassword,
                          isLoading: isLoading,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpDigit(int index) {
    return SizedBox(
      width: 48,
      height: 64,
      child: TextField(
        enabled: !ref.watch(forgotPasswordViewModelProvider).isVerified,
        controller: _otpControllers[index],
        focusNode: _otpFocusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textLight,
        ),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: AppColors.backgroundDark,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.surfaceDark),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.surfaceDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 5) {
              FocusScope.of(context).requestFocus(_otpFocusNodes[index + 1]);
            } else {
              FocusScope.of(context).unfocus();
            }
          } else {
            if (index > 0) {
              FocusScope.of(context).requestFocus(_otpFocusNodes[index - 1]);
            }
          }
        },
      ),
    );
  }
}
