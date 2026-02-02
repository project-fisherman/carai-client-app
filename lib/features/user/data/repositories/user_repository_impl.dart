import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../features/auth/domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

part 'user_repository_impl.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(ref.watch(userRemoteDataSourceProvider));
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, User>> getMe() async {
    try {
      final response = await _remoteDataSource.getMe();
      return Right(
        User(
          id: response.userId,
          phoneNumber: response.phoneNumber,
          name: response.name,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> updateMe({required String name}) async {
    try {
      final response = await _remoteDataSource.updateMe(name: name);
      return Right(
        User(
          id: response.userId,
          phoneNumber: response.phoneNumber,
          name: response.name,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
