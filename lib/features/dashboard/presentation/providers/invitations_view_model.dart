import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/mechanic_dashboard_repository_impl.dart';
import '../providers/dashboard_view_model.dart';
import '../../data/dtos/mechanic_dashboard_dtos.dart';

part 'invitations_view_model.g.dart';

@riverpod
class InvitationsViewModel extends _$InvitationsViewModel {
  @override
  Future<List<MyPendingInviteResponseDto>> build() async {
    final repository = ref.watch(mechanicDashboardRepositoryProvider);
    final result = await repository.getMyPendingInvites();
    
    return result.fold(
      (failure) => throw failure,
      (invites) => invites,
    );
  }

  Future<bool> accept(String shopId) async {
    final repository = ref.read(mechanicDashboardRepositoryProvider);
    final result = await repository.acceptInvite(shopId: shopId);

    return result.fold(
      (failure) => false,
      (_) {
        ref.invalidateSelf();
        ref.read(dashboardViewModelProvider.notifier).refresh();
        return true;
      },
    );
  }

  Future<bool> reject(String shopId) async {
    final repository = ref.read(mechanicDashboardRepositoryProvider);
    final result = await repository.rejectInvite(shopId: shopId);

    return result.fold(
      (failure) => false,
      (_) {
        ref.invalidateSelf();
        return true;
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(mechanicDashboardRepositoryProvider);
      final result = await repository.getMyPendingInvites();
      return result.fold((f) => throw f, (r) => r);
    });
  }
}
