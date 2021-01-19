import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/parameters/get_places_parameters.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';

abstract class SpaRepository {
  const SpaRepository();

  Future<Result<List<Place>, Failure>> getPlaces(
    GetPlacesParameters parameters,
  );
}
