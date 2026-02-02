import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../features/auth/domain/entities/user.dart';
import '../repositories/user_repository.dart';
import '../../data/repositories/user_repository_impl.dart';

part 'get_me_usecase.g.dart';

@riverpod
GetMeUseCase getMeUseCase(GetMeUseCaseRef ref) {
  return GetMeUseCase(ref.watch(userRepositoryProvider));
}

class GetMeUseCase {
  final UserRepository _repository;

  GetMeUseCase(this._repository);

  Future<Either<Failure, User>> call() {
    return _repository.getMe();
  }
}
