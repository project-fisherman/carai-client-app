import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class SendSmsCodeUseCase {
  final AuthRepository _repository;

  SendSmsCodeUseCase(this._repository);

  Future<Either<Failure, void>> call({required String phoneNumber}) {
    return _repository.sendSmsCode(phoneNumber: phoneNumber);
  }
}
