import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/repair_shop.dart';
import '../../domain/usecases/mechanic_dashboard_use_cases.dart';

part 'dashboard_view_model.g.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  @override
  Future<List<RepairShop>> build() async {
    return _fetchShops();
  }

  Future<List<RepairShop>> _fetchShops() async {
    final result = await ref.read(getMyShopsUseCaseProvider)();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (shops) => shops,
    );
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
