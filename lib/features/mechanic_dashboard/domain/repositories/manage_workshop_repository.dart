import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/repair_shop_user.dart';

abstract class ManageWorkshopRepository {
  Future<Either<Failure, List<RepairShopUser>>> getShopUsers({
    required String shopId,
  });

  Future<Either<Failure, void>> kickUser({
    required String shopId,
    required String targetUserId,
  });

  Future<Either<Failure, void>> changeRole({
    required String shopId,
    required String targetUserId,
    required RepairShopRole newRole,
  });
}
