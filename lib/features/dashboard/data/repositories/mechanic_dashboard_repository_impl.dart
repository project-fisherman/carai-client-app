import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/file_api.dart';
import '../data_sources/repair_shop_api.dart';
import '../dtos/mechanic_dashboard_dtos.dart';
import '../../domain/entities/repair_shop.dart';
import '../../domain/repositories/mechanic_dashboard_repository.dart';

part 'mechanic_dashboard_repository_impl.g.dart';

@riverpod
MechanicDashboardRepository mechanicDashboardRepository(
  MechanicDashboardRepositoryRef ref,
) {
  return MechanicDashboardRepositoryImpl(
    ref.watch(fileApiProvider),
    ref.watch(repairShopApiProvider),
  );
}

class MechanicDashboardRepositoryImpl implements MechanicDashboardRepository {
  final FileApi _fileApi;
  final RepairShopApi _repairShopApi;

  MechanicDashboardRepositoryImpl(this._fileApi, this._repairShopApi);

  @override
  Future<Either<Failure, RepairShop>> createShop({
    required String name,
    required String address,
    required String phoneNumber,
    XFile? profileImage,
  }) async {
    try {
      String? profileImageUrl;
      if (profileImage != null) {
        profileImageUrl = await _fileApi.uploadProfileImage(profileImage);
      }

      final request = CreateShopRequestDto(
        name: name,
        address: address,
        phoneNumber: phoneNumber,
        profileImageUrl: profileImageUrl,
      );

      final responseDto = await _repairShopApi.createShop(request: request);

      final shop = RepairShop(
        id: responseDto.id,
        name: responseDto.name,
        address: responseDto.address,
        phoneNumber: responseDto.phoneNumber,
        checklistCount: responseDto.checklistCount,
        profileImageUrl: responseDto.profileImageUrl,
      );

      // Perform local persistence
      // Note: We are not injecting Hive box here for simplicity but ideally we should have a LocalDataSource
      // Accessing box directly for quick implementation as per request
      final box = Hive.box(
        'repairShopsBox',
      ); // Ensure this box is opened in main.dart
      // Use string key to avoid Hive integer key range limitation (0-0xFFFFFFFF)
      await box.put(shop.id, shop.toJson());

      return Right(shop);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RepairShop>>> getMyShops() async {
    try {
      final responseDtos = await _repairShopApi.getMyShops();
      final shops = responseDtos
          .map(
            (dto) => RepairShop(
              id: dto.id,
              name: dto.name,
              address: dto.address,
              phoneNumber: dto.phoneNumber,
              checklistCount: dto.checklistCount,
              profileImageUrl: dto.profileImageUrl,
            ),
          )
          .toList();

      // Update local cache
      final box = Hive.box('repairShopsBox');
      await box
          .clear(); // Clear old cache or update intelligently? Clearing for now to be simple sync.
      for (var shop in shops) {
        // Use string key to avoid Hive integer key range limitation (0-0xFFFFFFFF)
        await box.put(shop.id, shop.toJson());
      }

      return Right(shops);
    } catch (e) {
      // Fallback to local cache if offline or error
      // Ideally check for NetworkFailure but catch-all for now
      try {
        final box = Hive.box('repairShopsBox');
        final shops = box.values
            .map((e) => RepairShop.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        if (shops.isNotEmpty) {
          return Right(shops);
        }
      } catch (hiveError) {
        // Ignore hive error and return original error
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> leaveShop({required String shopId}) async {
    try {
      await _repairShopApi.leaveShop(shopId: shopId);

      // Remove from local cache
      final box = Hive.box('repairShopsBox');
      await box.delete(shopId);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
