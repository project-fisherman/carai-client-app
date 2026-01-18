import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecases/send_sms_code_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../../domain/usecases/verify_sms_code_usecase.dart';
import '../providers/auth_providers.dart';
import '../../../../core/error/failure.dart';

part 'registration_view_model.freezed.dart';
part 'registration_view_model.g.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(false) bool isSmsSent,
    @Default(false) bool isLoading,
    @Default(null) String? error,
    @Default(null) String? successMessage,
    @Default(null) String? verificationToken,
    @Default(false) bool isVerified,
    @Default(0) int remainingTime,
  }) = _RegistrationState;
}

@riverpod
class RegistrationViewModel extends _$RegistrationViewModel {
  Timer? _timer;

  @override
  RegistrationState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return const RegistrationState();
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
        return state.copyWith(isLoading: false, isSmsSent: true, successMessage: "SMS Code Sent!", remainingTime: expireSeconds, isVerified: false, verificationToken: null);
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
    final verifyResult = await verifySmsUseCase(phoneNumber: sanitizedPhoneNumber, code: smsCode);
    
    state = verifyResult.fold(
      (failure) => state.copyWith(isLoading: false, error: "Verification Failed: ${failure.message}"),
      (token) {
        _timer?.cancel(); // Stop timer on success
        return state.copyWith(isLoading: false, isVerified: true, verificationToken: token, successMessage: "Phone Verified!", remainingTime: 0);
      },
    );
  }

  Future<void> register({
    required String phoneNumber,
    required String username,
    required String password,
  }) async {
    if (!state.isVerified || state.verificationToken == null) {
      state = state.copyWith(error: "Please verify phone number first.");
      return;
    }

    state = state.copyWith(isLoading: true, error: null);
    
    final sanitizedPhoneNumber = phoneNumber.replaceAll('-', '');
    final signupUseCase = ref.read(signupUseCaseProvider);
    
    final signupResult = await signupUseCase(
      phoneNumber: sanitizedPhoneNumber,
      username: username,
      password: password,
      verificationToken: state.verificationToken!,
    );
         
    state = signupResult.fold(
      (failure) => state.copyWith(isLoading: false, error: failure.message),
      (_) => state.copyWith(isLoading: false, successMessage: "Registration Successful!"),
    );
  }
}
