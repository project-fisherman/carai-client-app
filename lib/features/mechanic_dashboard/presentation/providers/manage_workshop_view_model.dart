import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/repair_shop_user.dart';
import '../../domain/repositories/manage_workshop_repository.dart';
import '../../data/repositories/manage_workshop_repository_impl.dart';

part 'manage_workshop_view_model.g.dart';

@riverpod
ManageWorkshopRepository manageWorkshopRepository(
  ManageWorkshopRepositoryRef ref,
) {
  final dio = ref.watch(dioProvider);
  return ManageWorkshopRepositoryImpl(dio);
}

@riverpod
class ManageWorkshopViewModel extends _$ManageWorkshopViewModel {
  @override
  @override
  FutureOr<List<RepairShopUser>> build(String shopId) async {
    return _fetchUsers(shopId);
  }

  Future<List<RepairShopUser>> _fetchUsers(String shopId) async {
    final repository = ref.read(manageWorkshopRepositoryProvider);
    final result = await repository.getShopUsers(shopId: shopId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (users) => users,
    );
  }

  List<RepairShopUser> get pendingUsers {
    return state.value
            ?.where((u) => u.role == RepairShopRole.invited)
            .toList() ??
        [];
  }

  List<RepairShopUser> get activeUsers {
    return state.value
            ?.where((u) => u.role != RepairShopRole.invited)
            .toList() ??
        [];
  }

  Future<void> kickUser(String targetUserId) async {
    final repository = ref.read(manageWorkshopRepositoryProvider);
    final result = await repository.kickUser(
      shopId: shopId,
      targetUserId: targetUserId,
    );

    result.fold(
      (failure) => throw Exception(failure.message),
      (_) => ref.invalidateSelf(),
    );
  }

  Future<String?> inviteUser(String phoneNumber) async {
    final repository = ref.read(manageWorkshopRepositoryProvider);
    final result = await repository.inviteByPhone(
      shopId: shopId,
      phoneNumber: phoneNumber,
    );

    return result.fold(
      (failure) => throw Exception(failure.message),
      (token) {
        ref.invalidateSelf();
        return token;
      },
    );
  }

  Future<void> cancelInvitation(String targetUserId) async {
    final repository = ref.read(manageWorkshopRepositoryProvider);
    final result = await repository.kickUser(
      shopId: shopId,
      targetUserId: targetUserId,
    );

    result.fold(
      (failure) => throw Exception(failure.message),
      (_) => ref.invalidateSelf(),
    );
  }
}
