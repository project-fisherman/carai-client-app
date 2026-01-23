import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class VerifySmsCodeUseCase {
  final AuthRepository _repository;

  VerifySmsCodeUseCase(this._repository);

  Future<Either<Failure, String>> call({required String phoneNumber, required String code}) {
    return _repository.verifySmsCode(phoneNumber: phoneNumber, code: code);
  }
}
