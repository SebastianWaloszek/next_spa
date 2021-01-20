import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';

abstract class PlaceRepository {
  const PlaceRepository();

  Future<Result<Place, Failure>> getPlace(PlaceLocation location);
}
