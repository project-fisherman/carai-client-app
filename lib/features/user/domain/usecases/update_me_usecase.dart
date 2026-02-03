import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../features/auth/domain/entities/user.dart';
import '../repositories/user_repository.dart';
import '../../data/repositories/user_repository_impl.dart';

part 'update_me_usecase.g.dart';

@riverpod
UpdateMeUseCase updateMeUseCase(UpdateMeUseCaseRef ref) {
  return UpdateMeUseCase(ref.watch(userRepositoryProvider));
}

class UpdateMeUseCase {
  final UserRepository _repository;

  UpdateMeUseCase(this._repository);

  Future<Either<Failure, User>> call({required String name}) {
    return _repository.updateMe(name: name);
  }
}
