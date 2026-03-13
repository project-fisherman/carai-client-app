import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../providers/auth_providers.dart';
import '../../domain/usecases/reset_password_usecase.dart';

part 'forgot_password_view_model.freezed.dart';
part 'forgot_password_view_model.g.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(false) bool isSmsSent,
    @Default(false) bool isLoading,
    @Default(false) bool isVerified,
    @Default(false) bool isResetComplete,
    @Default(0) int remainingTime,
    @Default(null) String? verificationToken,
    @Default(null) String? error,
  }) = _ForgotPasswordState;
}

@riverpod
class ForgotPasswordViewModel extends _$ForgotPasswordViewModel {
  Timer? _timer;

  @override
  ForgotPasswordState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return const ForgotPasswordState();
  }

  Future<void> sendSmsCode(String phoneNumber) async {
    state = state.copyWith(isLoading: true, error: null);

    final sanitizedPhoneNumber = phoneNumber.replaceAll('-', '');
    final sendSmsUseCase = ref.read(sendSmsCodeUseCaseProvider);
    final result = await sendSmsUseCase(phoneNumber: sanitizedPhoneNumber);

    state = result.fold(
      (failure) => state.copyWith(isLoading: false, error: failure.message),
      (expireSeconds) {
        _startTimer(expireSeconds);
        return state.copyWith(
          isLoading: false,
          isSmsSent: true,
          remainingTime: expireSeconds,
          isVerified: false,
          verificationToken: null,
        );
      },
    );
  }

  void _startTimer(int seconds) {
    _timer?.cancel();
    state = state.copyWith(remainingTime: seconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingTime > 0) {
        state = state.copyWith(remainingTime: state.remainingTime - 1);
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> verifySmsCode({
    required String phoneNumber,
    required String smsCode,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final sanitizedPhoneNumber = phoneNumber.replaceAll('-', '');
    final verifySmsUseCase = ref.read(verifySmsCodeUseCaseProvider);
    final result = await verifySmsUseCase(
      phoneNumber: sanitizedPhoneNumber,
      code: smsCode,
    );

    state = result.fold(
      (failure) => state.copyWith(isLoading: false, error: failure.message),
      (token) {
        _timer?.cancel();
        return state.copyWith(
          isLoading: false,
          isVerified: true,
          verificationToken: token,
          remainingTime: 0,
        );
      },
    );
  }

  Future<void> resetPassword({
    required String phoneNumber,
    required String username,
    required String newPassword,
  }) async {
    if (!state.isVerified || state.verificationToken == null) {
      state = state.copyWith(error: '전화번호 인증을 먼저 완료해주세요.');
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    final sanitizedPhoneNumber = phoneNumber.replaceAll('-', '');
    final resetUseCase = ref.read(resetPasswordUseCaseProvider);
    final result = await resetUseCase(
      phoneNumber: sanitizedPhoneNumber,
      username: username,
      verificationToken: state.verificationToken!,
      newPassword: newPassword,
    );

    state = result.fold(
      (failure) => state.copyWith(isLoading: false, error: failure.message),
      (_) => state.copyWith(isLoading: false, isResetComplete: true),
    );
  }
}
