import 'package:core/core.dart';

abstract class AuthRepository {
  Future<Either<Failure<String>, Unit>> signIn(String email, String password);
  Future<Either<Failure, bool>> isAuthenticated();
  Future<Either<Failure, Unit>> logOut();
}
