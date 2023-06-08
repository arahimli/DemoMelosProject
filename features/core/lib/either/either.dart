import 'package:core/core.dart';
import 'package:meta/meta.dart';

// # An Example for ---
call() async{
  final result = await getResult();

  result.when(error: (er){

  }, success: (su){

  });

}

class Success {}

Future<Either<Failure, Success>> getResult() async {
  try {
    return Left(Failure.internalServer());
  } catch(_) {
    return Right(Success());
  }
}

// # An Example for ---



typedef OnError<E> = void Function(E error);
typedef OnSuccess<S> = void Function(S success);

sealed class Either<E, S>  {

  const Either();


  void when({
    required OnError<E> error,
    required OnSuccess<S> success,
  });
}

final class Left<E, S> extends Either<E, S> {
  Left(this._error);

  E _error;

  @override
  void when({
    required OnError<E> error,
    required OnSuccess<S> success,
  }) {
    error(_error);
  }
}

final class Right<E, S> extends Either<E,S> {
  Right(this._success);

  S _success;

  @override
  void when({
    required OnError<E> error,
    required OnSuccess<S> success,
  }) {
    success(_success);
  }
}

@immutable
class Unit {
  const Unit._internal();

  @override
  String toString() => '()';
}

const Unit unit = Unit._internal();
