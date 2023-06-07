import 'package:core/core.dart';

import '../repositories/auth_repository.dart';

class IsAuthenticated extends AsyncUsecase<Failure, bool, NoParams> {
  IsAuthenticated(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return authRepository.isAuthenticated();
  }
}
