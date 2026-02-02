import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/auth_token.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String phoneNumber,
    required String username,
    required String password,
  });
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User?>> checkAuthStatus();

  // Registration & SMS
  Future<Either<Failure, int>> sendSmsCode({required String phoneNumber});
  Future<Either<Failure, String>> verifySmsCode({
    required String phoneNumber,
    required String code,
  });
  Future<Either<Failure, AuthToken>> signup({
    required String phoneNumber,
    required String username,
    required String password,
    required String verificationToken,
  });
  Future<Either<Failure, AuthToken>> refreshToken();
}
