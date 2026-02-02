import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';

part 'change_password_usecase.g.dart';

@riverpod
ChangePasswordUseCase changePasswordUseCase(ChangePasswordUseCaseRef ref) {
  return ChangePasswordUseCase(ref.watch(authRepositoryProvider));
}

class ChangePasswordUseCase {
  final AuthRepository _repository;

  ChangePasswordUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String phoneNumber,
    required String username,
    required String oldPassword,
    required String newPassword,
  }) {
    return _repository.changePassword(
      phoneNumber: phoneNumber,
      username: username,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
