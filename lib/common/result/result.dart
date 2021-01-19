import 'package:flutter/foundation.dart';
import 'package:spa_coding_exercise/common/error/failure.dart';

abstract class Result<S, F extends Failure> {
  R fold<R>({
    @required R Function(S) onSuccess,
    @required R Function(F) onFailure,
  });
}
