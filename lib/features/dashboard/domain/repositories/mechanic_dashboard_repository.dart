import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/error/failure.dart';
import '../entities/repair_shop.dart';

abstract class MechanicDashboardRepository {
  Future<Either<Failure, RepairShop>> createShop({
    required String name,
    required String address,
    required String phoneNumber,
    XFile? profileImage,
  });

  Future<Either<Failure, List<RepairShop>>> getMyShops();
}
