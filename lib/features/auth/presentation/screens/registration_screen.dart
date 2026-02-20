import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../design_system/atoms/app_button.dart';
import '../../../../design_system/atoms/app_input.dart';
import '../../../../design_system/molecules/app_scaffold.dart';
import '../../../../design_system/foundations/app_colors.dart';
import '../viewmodels/registration_view_model.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _phoneController = TextEditingController();
  final _usernameController =
      TextEditingController(); // Added username field for signup (design had it)
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // OTP Controllers
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
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('전화번호를 입력해주세요')));
      return;
    }
    ref
        .read(registrationViewModelProvider.notifier)
        .sendSmsCode(_phoneController.text);
  }

  void _onVerify() {
    final smsCode = _otpControllers.map((e) => e.text).join();
    if (smsCode.length != 6) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('올바른 6자리 인증번호를 입력해주세요')));
      return;
    }
    ref
        .read(registrationViewModelProvider.notifier)
        .verifySmsCode(phoneNumber: _phoneController.text, smsCode: smsCode);
  }

  void _onRegister() {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('비밀번호가 일치하지 않습니다')));
      return;
    }

    ref
        .read(registrationViewModelProvider.notifier)
        .register(
          phoneNumber: _phoneController.text,
          username: _usernameController.text,
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(registrationViewModelProvider, (previous, next) {
      if (next.error != null && next.error != previous?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), backgroundColor: Colors.red),
        );
      }
      if (next.successMessage != null &&
          next.successMessage != previous?.successMessage) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.successMessage!)));
        if (next.successMessage == "Registration Successful!") {
          context.go('/home'); // Or login
        }
      }
    });

    final state = ref.watch(registrationViewModelProvider);
    final isLoading = state.isLoading;
    final isSmsSent = state.isSmsSent;
    final isVerified = state.isVerified;
    final remainingTime = state.remainingTime;

    return AppScaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: AppColors.textDark),
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
                    Icons.phonelink_setup,
                    color: AppColors.primary,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '기기 등록',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                '접근 권한 설정을 위해 휴대전화 번호를 입력하고 비밀번호를 생성하세요.',
                style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Step 1: Phone
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    AppInput(
                      label:
                          '휴대전화 번호', // Actually label inside component covers layout
                      placeholder: '010-0000-0000',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      suffixIcon: const Icon(
                        Icons.smartphone,
                        color: AppColors.placeholder,
                      ),
                      enabled: !isVerified,
                    ),
                    if (!isSmsSent) ...[
                      const SizedBox(height: 24),
                      AppButton(
                        text: '인증번호 전송',
                        onPressed: isLoading ? () {} : _onSendSms,
                        isLoading:
                            isLoading &&
                            !isSmsSent, // Only show loading here if SMS not sent yet
                      ),
                    ],
                  ],
                ),
              ),

              if (isSmsSent) ...[
                const SizedBox(height: 32),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "인증 및 보안",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 32),

                // Step 2: Verification Details
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
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
                                onPressed: (remainingTime > 0 || isVerified)
                                    ? null
                                    : _onSendSms,
                                child: Text(
                                  "재전송",
                                  style: TextStyle(
                                    color: (remainingTime > 0 || isVerified)
                                        ? AppColors.textSecondary
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
                      // OTP Input
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
                        const Divider(),
                        const SizedBox(height: 24),

                        AppInput(
                          label: '사용자 이름',
                          placeholder: '사용자 이름',
                          controller: _usernameController,
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 16),
                        AppInput(
                          label: '비밀번호 생성',
                          placeholder: '••••••••',
                          isPassword: true,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 16),
                        AppInput(
                          label: '비밀번호 확인',
                          placeholder: '••••••••',
                          isPassword: true,
                          controller: _confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 32),

                        AppButton(
                          text: '등록 완료',
                          onPressed: isLoading ? () {} : _onRegister,
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
      width: 48, // slightly smaller to fit
      height: 64,
      child: TextField(
        enabled: !ref.watch(registrationViewModelProvider).isVerified,
        controller: _otpControllers[index],
        focusNode: _otpFocusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: AppColors.backgroundLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.border),
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
