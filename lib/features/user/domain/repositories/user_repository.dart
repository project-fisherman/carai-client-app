import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../features/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getMe();
  Future<Either<Failure, User>> updateMe({required String name});
}
