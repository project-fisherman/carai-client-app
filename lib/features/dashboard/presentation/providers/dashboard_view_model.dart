import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/data/datasources/auth_local_data_source.dart';
import '../../../auth/presentation/providers/token_refresh_manager.dart';
import '../../domain/entities/repair_shop.dart';
import '../../domain/usecases/mechanic_dashboard_use_cases.dart';

part 'dashboard_view_model.g.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  @override
  Future<List<RepairShop>> build() async {
    // Wait for token refresh to complete
    final tokenRefreshState = ref.watch(tokenRefreshManagerProvider);

    // If still loading, wait for it
    if (tokenRefreshState.isLoading) {
      debugPrint('⏳ [DashboardViewModel] Waiting for token refresh...');
      final refreshSuccess = await ref.watch(
        tokenRefreshManagerProvider.future,
      );
      if (!refreshSuccess) {
        debugPrint(
          '⚠️ [DashboardViewModel] Token refresh failed, skipping shop fetch',
        );
        return [];
      }
    }

    // Token is refreshed and valid, check if we have a token
    final token = ref.watch(authLocalDataSourceProvider).getAccessToken();
    if (token == null) {
      debugPrint(
        '⚠️ [DashboardViewModel] No token available, skipping shop fetch',
      );
      return [];
    }

    debugPrint('✅ [DashboardViewModel] Token ready, fetching shops...');
    return _fetchShops();
  }

  Future<List<RepairShop>> _fetchShops() async {
    final result = await ref.read(getMyShopsUseCaseProvider)();
    return result.fold((failure) => throw Exception(failure.message), (shops) {
      // Mock data for demonstration
      final mockShops = [
        const RepairShop(
          id: -1,
          name: 'Gangnam Auto Repair',
          address: '123 Teheran-ro, Gangnam-gu, Seoul',
          phoneNumber: '02-123-4567',
          profileImageUrl: 'https://picsum.photos/id/10/200/200',
        ),
        const RepairShop(
          id: -2,
          name: 'Speedy Motors',
          address: '456  Seongsu-iro, Seongdong-gu, Seoul',
          phoneNumber: '02-987-6543',
          profileImageUrl: 'https://picsum.photos/id/20/200/200',
        ),
      ];

      if (shops.isEmpty) {
        return mockShops;
      }
      return [...shops, ...mockShops];
    });
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchShops());
  }

  Future<void> createShop({
    required String name,
    required String address,
    required String phoneNumber,
    XFile? profileImage,
  }) async {
    // We can assume profileImage is XFile as per repository
    final result = await ref
        .read(createShopUseCaseProvider)
        .call(
          name: name,
          address: address,
          phoneNumber: phoneNumber,
          profileImage: profileImage,
        );

    result.fold((failure) => throw Exception(failure.message), (newShop) {
      // Optimistically update or refresh
      // Since we just added a shop, we can refresh the list
      refresh();
    });
  }
}
