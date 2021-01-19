import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/domain/entities/location.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';

abstract class PlaceDataSource {
  const PlaceDataSource();

  Future<Result<Place, Failure>> getPlace(Location location);
}
