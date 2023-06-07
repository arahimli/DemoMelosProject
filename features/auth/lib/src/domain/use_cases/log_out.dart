import 'package:core/core.dart';

import '../repositories/auth_repository.dart';

class LogOut extends AsyncUseCase<Failure, Unit, NoParams> {
  LogOut(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, Unit>> call(NoParams params) {
    return authRepository.logOut();
  }
}
