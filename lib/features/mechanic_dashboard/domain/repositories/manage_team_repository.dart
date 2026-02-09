import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/repair_shop_user.dart';

abstract class ManageTeamRepository {
  Future<Either<Failure, List<RepairShopUser>>> getShopUsers({
    required int shopId,
  });

  Future<Either<Failure, void>> kickUser({
    required int shopId,
    required String targetUserId,
  });

  Future<Either<Failure, void>> changeRole({
    required int shopId,
    required String targetUserId,
    required RepairShopRole newRole,
  });
}
