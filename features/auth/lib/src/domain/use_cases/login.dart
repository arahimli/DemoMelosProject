import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

import '../repositories/auth_repository.dart';

class Login extends AsyncUseCase<Failure<String?>, Unit, LoginParams> {
  Login(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure<String?>, Unit>> call(LoginParams params) {
    return authRepository.signIn(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
