import 'package:core/core.dart';
import 'package:dio/dio.dart';

import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
  });

  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    try {
      final accessToken = await authLocalDataSource.accessToken;

      if (accessToken == null) {
        return Right(false);
      }

      final isAuthenticated =
          await authRemoteDataSource.isAuthenticated(accessToken);

      return Right(isAuthenticated);
    } catch (_) {
      return Left(Failure.cache());
    }
  }

  @override
  Future<Either<Failure<String>, Unit>> signIn(
    String email,
    String password,
  ) async {
    try {
      final result = await authRemoteDataSource.signIn(email, password);

      await authLocalDataSource.persistAccessToken(
        result.accessToken,
      );
      await authLocalDataSource.persistRefreshToken(
        result.refreshToken,
      );

      return Right(unit);
    } on DioError catch (e) {
      try {
        final message = e.response!.data['message'];
        return Left(Failure.internalServer(message));
      } catch (_) {
        return Left(Failure.internalServer());
      }
    } catch (_) {
      return Left(Failure.other());
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      await authLocalDataSource.clearTokens();

      return Right(unit);
    } catch (_) {
      return Left(Failure.internalServer());
    }
  }
}
