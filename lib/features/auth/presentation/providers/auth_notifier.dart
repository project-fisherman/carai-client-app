import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/check_auth_status_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import 'auth_providers.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late final LoginUseCase _loginUseCase;
  late final LogoutUseCase _logoutUseCase;
  late final CheckAuthStatusUseCase _checkAuthStatusUseCase;

  @override
  Future<User?> build() async {
    _loginUseCase = ref.watch(loginUseCaseProvider);
    _logoutUseCase = ref.watch(logoutUseCaseProvider);
    _checkAuthStatusUseCase = ref.watch(checkAuthStatusUseCaseProvider);

    return _checkAuthStatus();
  }

  Future<User?> _checkAuthStatus() async {
    final result = await _checkAuthStatusUseCase();
    return result.fold(
      (failure) =>
          null, // Or throw if you want to show error on startup, but usually silence.
      (user) => user,
    );
  }

  Future<void> login(
    String phoneNumber,
    String username,
    String password,
  ) async {
    state = const AsyncValue.loading();
    final result = await _loginUseCase(
      phoneNumber: phoneNumber,
      username: username,
      password: password,
    );

    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (user) => AsyncValue.data(user),
    );
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    final result = await _logoutUseCase();

    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}
