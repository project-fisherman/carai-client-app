import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({required String phoneNumber, required String password});
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User?>> checkAuthStatus();
}
