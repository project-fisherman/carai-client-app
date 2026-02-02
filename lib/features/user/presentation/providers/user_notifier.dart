import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../features/auth/domain/entities/user.dart';
import '../../domain/usecases/get_me_usecase.dart';
import '../../domain/usecases/update_me_usecase.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<User?> build() async {
    return _fetchUser();
  }

  Future<User?> _fetchUser() async {
    final result = await ref.read(getMeUseCaseProvider).call();
    return result.fold((failure) {
      // Handle failure if needed, maybe log or rethrow?
      // returning null for now as per "User?" return type
      // Or state could be AsyncValue.error
      throw failure;
    }, (user) => user);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchUser());
  }

  Future<void> updateName(String name) async {
    state = const AsyncValue.loading();
    final result = await ref.read(updateMeUseCaseProvider).call(name: name);
    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (user) {
        state = AsyncValue.data(user);
      },
    );
  }
}
