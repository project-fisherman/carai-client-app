import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/auth_notifier.dart';
import '../providers/auth_providers.dart';
import '../../../dashboard/presentation/providers/dashboard_view_model.dart';
import '../../../user/presentation/providers/user_notifier.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<void> login({
    required String phoneNumber,
    required String username,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final sanitizedPhoneNumber = phoneNumber.replaceAll('-', '');

    // LoginUseCase를 직접 호출하여 성공/실패를 정확히 감지
    final loginUseCase = ref.read(loginUseCaseProvider);
    final result = await loginUseCase(
      phoneNumber: sanitizedPhoneNumber,
      username: username,
      password: password,
    );

    result.fold(
      (failure) {
        // 실패: 에러 상태로 설정 (navigation 없음)
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (user) {
        // 성공: AuthNotifier에 user 등록 및 관련 provider 무효화
        ref.read(authNotifierProvider.notifier).setUser(user);
        ref.invalidate(dashboardViewModelProvider);
        ref.invalidate(userNotifierProvider);
        state = const AsyncValue.data(null);
      },
    );
  }
}
