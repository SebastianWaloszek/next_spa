import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';

abstract class UserLocationRepository {
  const UserLocationRepository();

  Future<Result<PlaceLocation, Failure>> getCurrentLocation();
}
