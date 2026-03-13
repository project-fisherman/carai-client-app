import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';

part 'reset_password_usecase.g.dart';

@riverpod
ResetPasswordUseCase resetPasswordUseCase(ResetPasswordUseCaseRef ref) {
  return ResetPasswordUseCase(ref.watch(authRepositoryProvider));
}

class ResetPasswordUseCase {
  final AuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String phoneNumber,
    required String username,
    required String verificationToken,
    required String newPassword,
  }) {
    return _repository.resetPassword(
      phoneNumber: phoneNumber,
      username: username,
      verificationToken: verificationToken,
      newPassword: newPassword,
    );
  }
}
