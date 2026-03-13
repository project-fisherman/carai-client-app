import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/error/failure.dart';
import '../entities/repair_shop.dart';

import '../../data/dtos/mechanic_dashboard_dtos.dart';

abstract class MechanicDashboardRepository {
  Future<Either<Failure, RepairShop>> createShop({
    required String name,
    required String address,
    required String phoneNumber,
    XFile? profileImage,
  });

  Future<Either<Failure, List<RepairShop>>> getMyShops();

  Future<Either<Failure, void>> leaveShop({required String shopId});

  Future<Either<Failure, List<MyPendingInviteResponseDto>>> getMyPendingInvites();
  Future<Either<Failure, void>> acceptInvite({required String shopId});
  Future<Either<Failure, void>> rejectInvite({required String shopId});
}
