import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecases/send_sms_code_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../../domain/usecases/verify_sms_code_usecase.dart';
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
  }) = _RegistrationState;
}

@riverpod
class RegistrationViewModel extends _$RegistrationViewModel {
  @override
  RegistrationState build() {
    return const RegistrationState();
  }

  Future<void> sendSmsCode(String phoneNumber) async {
    state = state.copyWith(isLoading: true, error: null);
    
    final sendSmsUseCase = ref.read(sendSmsCodeUseCaseProvider);
    final result = await sendSmsUseCase(phoneNumber: phoneNumber);
    
    state = result.fold(
      (failure) => state.copyWith(isLoading: false, error: failure.message),
      (_) => state.copyWith(isLoading: false, isSmsSent: true, successMessage: "SMS Code Sent!"),
    );
  }

  Future<void> register({
    required String phoneNumber,
    required String smsCode,
    required String username,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    // 1. Verify SMS Code
    final verifySmsUseCase = ref.read(verifySmsCodeUseCaseProvider);
    final verifyResult = await verifySmsUseCase(phoneNumber: phoneNumber, code: smsCode);
    
    verifyResult.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: "Verification Failed: ${failure.message}");
      },
      (verificationToken) async {
         // 2. Signup with token
         final signupUseCase = ref.read(signupUseCaseProvider);
         final signupResult = await signupUseCase(
           phoneNumber: phoneNumber,
           username: username,
           password: password,
           verificationToken: verificationToken,
         );
         
         state = signupResult.fold(
           (failure) => state.copyWith(isLoading: false, error: failure.message),
           (_) => state.copyWith(isLoading: false, successMessage: "Registration Successful!"), // Navigation should happen in UI
         );
      },
    );
  }
}
