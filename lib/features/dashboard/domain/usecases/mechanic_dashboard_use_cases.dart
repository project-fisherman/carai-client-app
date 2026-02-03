import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../entities/repair_shop.dart';
import '../repositories/mechanic_dashboard_repository.dart';
import '../../data/repositories/mechanic_dashboard_repository_impl.dart';

part 'mechanic_dashboard_use_cases.g.dart';

@riverpod
CreateShopUseCase createShopUseCase(CreateShopUseCaseRef ref) {
  return CreateShopUseCase(ref.watch(mechanicDashboardRepositoryProvider));
}

@riverpod
GetMyShopsUseCase getMyShopsUseCase(GetMyShopsUseCaseRef ref) {
  return GetMyShopsUseCase(ref.watch(mechanicDashboardRepositoryProvider));
}

class CreateShopUseCase {
  final MechanicDashboardRepository _repository;

  CreateShopUseCase(this._repository);

  Future<Either<Failure, RepairShop>> call({
    required String name,
    required String address,
    required String phoneNumber,
    XFile? profileImage,
  }) {
    return _repository.createShop(
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
    );
  }
}

class GetMyShopsUseCase {
  final MechanicDashboardRepository _repository;

  GetMyShopsUseCase(this._repository);

  Future<Either<Failure, List<RepairShop>>> call() {
    return _repository.getMyShops();
  }
}
