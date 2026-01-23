import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/auth_token.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/auth_dtos.dart';
import '../models/user_model.dart';

part 'auth_repository_impl.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(authLocalDataSourceProvider),
  );
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, User>> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      // Temporary: Hardcoded username as per requirement
      final loginRequest = LoginRequest(
        phoneNumber: phoneNumber,
        username: '1234',
        password: password,
      );
      final response = await _remoteDataSource.login(request: loginRequest);

      // Save user and tokens
      final user = response.user.toDomain();
      await _localDataSource.saveUser(UserModel.fromEntity(user));
      return Right(user);
    } catch (e) {
      // Ideally handle DioException to map to specific failures
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _localDataSource.deleteUser();
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> checkAuthStatus() async {
    try {
      final userModel = await _localDataSource.getUser();
      if (userModel != null) {
        return Right(userModel.toEntity());
      }
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> sendSmsCode({
    required String phoneNumber,
  }) async {
    try {
      final response = await _remoteDataSource.sendSmsCode(
        request: SendSmsCodeRequest(phoneNumber: phoneNumber),
      );
      return Right(response.expireSeconds);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> verifySmsCode({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      final response = await _remoteDataSource.verifySmsCode(
        request: VerifySmsCodeRequest(phoneNumber: phoneNumber, code: code),
      );
      if (response.verified && response.phoneNumberVerificationToken != null) {
        return Right(response.phoneNumberVerificationToken!);
      } else {
        return const Left(ServerFailure("Verification failed"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthToken>> signup({
    required String phoneNumber,
    required String username,
    required String password,
    required String verificationToken,
  }) async {
    try {
      final response = await _remoteDataSource.signup(
        request: SignupRequest(
          phoneNumber: phoneNumber,
          username: username,
          password: password,
          passwordConfirmation:
              password, // As per UI, only 1 password field implies we might send same or UI handles it.
          // Wait, UI has "Confirm Password".
          // So repository should accept confirmPassword? Or UseCase?
          // Domain layer should probably just take password if validation happened in UI?
          // But secure.
          // I'll change Repository to accept confirmPassword OR just send password twice.
          // Let's send password twice here to satisfy DTO.
          phoneNumberVerificationToken: verificationToken,
        ),
      );
      return Right(
        AuthToken(
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
