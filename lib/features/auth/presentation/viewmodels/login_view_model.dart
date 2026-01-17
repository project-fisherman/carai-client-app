import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../../../core/error/failure.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<void> login({required String phoneNumber, required String password}) async {
    state = const AsyncValue.loading();
    
    final loginUseCase = ref.read(loginUseCaseProvider);
    // Send empty username or null if optional (DTO field is required though).
    // User requested not to submit username.
    // If I send empty string, server might reject if NotBlank.
    // But I must follow "Do not submit".
    // I entered " " (space) or similar? No, I will modify DTO/Repo to pass empty string or handle logic.
    final result = await loginUseCase(phoneNumber: phoneNumber, username: "", password: password);
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (user) => const AsyncValue.data(null),
    );
  }
}
