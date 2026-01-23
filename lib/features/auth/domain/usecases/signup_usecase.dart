import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/auth_token.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository _repository;

  SignupUseCase(this._repository);

  Future<Either<Failure, AuthToken>> call({
    required String phoneNumber,
    required String username,
    required String password,
    required String verificationToken,
  }) {
    return _repository.signup(
      phoneNumber: phoneNumber,
      username: username,
      password: password,
      verificationToken: verificationToken,
    );
  }
}
