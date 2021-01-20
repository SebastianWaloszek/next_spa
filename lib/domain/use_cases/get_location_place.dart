import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/repositories/place_repository.dart';
import 'package:spa_coding_exercise/domain/use_cases/use_case.dart';

class GetLocationPlace extends UseCase<Place, PlaceLocation> {
  final PlaceRepository _repository;

  const GetLocationPlace(this._repository) : assert(_repository != null);

  @override
  Future<Result<Place, Failure>> call(PlaceLocation location) {
    return _repository.getPlace(location);
  }
}
