import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../dashboard/domain/repositories/mechanic_dashboard_repository.dart';
import '../../../dashboard/data/repositories/mechanic_dashboard_repository_impl.dart';

part 'invitation_provider.g.dart';

@riverpod
class InvitationState extends _$InvitationState {
  @override
  String? build() {
    final box = Hive.box('invitationBox');
    return box.get('token') as String?;
  }

  Future<void> saveToken(String token) async {
    final box = Hive.box('invitationBox');
    await box.put('token', token);
    state = token;
  }

  Future<void> clearToken() async {
    final box = Hive.box('invitationBox');
    await box.delete('token');
    state = null;
  }
}

@riverpod
Future<bool> isInvitationPending(IsInvitationPendingRef ref) async {
  final token = ref.watch(invitationStateProvider);
  if (token == null) return false;

  final repository = ref.watch(mechanicDashboardRepositoryProvider);
  final result = await repository.isInvitePendingByToken(token: token);
  
  return result.fold(
    (failure) => false,
    (pending) => pending,
  );
}

@riverpod
class InvitationAction extends _$InvitationAction {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> acceptInvitation() async {
    final token = ref.read(invitationStateProvider);
    if (token == null) return;

    state = const AsyncValue.loading();
    final repository = ref.read(mechanicDashboardRepositoryProvider);
    final result = await repository.acceptInviteByToken(token: token);

    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (_) {
        ref.read(invitationStateProvider.notifier).clearToken();
        return const AsyncValue.data(null);
      },
    );
  }
}
