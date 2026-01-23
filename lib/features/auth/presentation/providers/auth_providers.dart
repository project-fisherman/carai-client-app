import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/check_auth_status_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/send_sms_code_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../../domain/usecases/verify_sms_code_usecase.dart';

part 'auth_providers.g.dart';

@riverpod
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
LogoutUseCase logoutUseCase(LogoutUseCaseRef ref) {
  return LogoutUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
CheckAuthStatusUseCase checkAuthStatusUseCase(CheckAuthStatusUseCaseRef ref) {
  return CheckAuthStatusUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
SendSmsCodeUseCase sendSmsCodeUseCase(SendSmsCodeUseCaseRef ref) {
  return SendSmsCodeUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
VerifySmsCodeUseCase verifySmsCodeUseCase(VerifySmsCodeUseCaseRef ref) {
  return VerifySmsCodeUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
SignupUseCase signupUseCase(SignupUseCaseRef ref) {
  return SignupUseCase(ref.watch(authRepositoryProvider));
}
