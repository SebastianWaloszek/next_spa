import 'package:spa_coding_exercise/common/error/failure.dart';
import '../../common/result/result.dart';

abstract class UseCase<T, P> {
  const UseCase();

  Future<Result<T, Failure>> call(P parameters);
}
