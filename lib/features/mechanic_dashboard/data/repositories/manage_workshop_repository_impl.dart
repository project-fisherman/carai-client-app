import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/repair_shop_user.dart';
import '../../domain/repositories/manage_workshop_repository.dart';
import '../dtos/manage_workshop_dtos.dart';

class ManageWorkshopRepositoryImpl implements ManageWorkshopRepository {
  final Dio _dio;

  ManageWorkshopRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, List<RepairShopUser>>> getShopUsers({
    required int shopId,
  }) async {
    try {
      final response = await _dio.get('/repair-shops/$shopId/users');
      // Backend ApiResponse uses 'result', not 'data'.
      final List<dynamic> data =
          (response.data['result'] as List<dynamic>?) ?? [];
      final dtos = data
          .map((json) => RepairShopUserResponse.fromJson(json))
          .toList();

      // Map to domain.
      final users = dtos.map((dto) => dto.toDomain()).toList();
      return Right(users);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown API Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> kickUser({
    required int shopId,
    required String targetUserId,
  }) async {
    try {
      await _dio.post(
        '/repair-shops/$shopId/kick',
        data: KickUserRequest(targetUserId: targetUserId).toJson(),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown API Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changeRole({
    required int shopId,
    required String targetUserId,
    required RepairShopRole newRole,
  }) async {
    try {
      await _dio.post(
        '/repair-shops/$shopId/role',
        data: ChangeRoleRequest(
          targetUserId: targetUserId,
          role: newRole.name.toUpperCase(),
        ).toJson(),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown API Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
