import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/auth_notifier.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final sanitizedPhoneNumber = phoneNumber.replaceAll('-', '');

    // Delegate to AuthNotifier to update global auth state
    await ref
        .read(authNotifierProvider.notifier)
        .login(sanitizedPhoneNumber, password);

    // Reflect AuthNotifier state in this ViewModel
    final authState = ref.read(authNotifierProvider);

    state = authState.when(
      data: (_) => const AsyncValue.data(null), // Success
      error: (error, stack) => AsyncValue.error(error, stack),
      loading: () => const AsyncValue.loading(),
    );
  }
}
