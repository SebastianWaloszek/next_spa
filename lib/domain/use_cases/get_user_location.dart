import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/domain/entities/location.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/repositories/place_repository.dart';
import 'package:spa_coding_exercise/domain/use_cases/use_case.dart';

class GetUserLocation extends UseCase<Place, Location> {
  final PlaceRepository _repository;

  const GetUserLocation(this._repository) : assert(_repository != null);

  @override
  Future<Result<Place, Failure>> call(Location location) {
    return _repository.getPlace(location);
  }
}
