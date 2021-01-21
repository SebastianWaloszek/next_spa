import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/result/failure_result.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/repositories/place_repository.dart';
import 'package:spa_coding_exercise/domain/repositories/user_location_repository.dart';
import 'package:spa_coding_exercise/domain/use_cases/use_case.dart';

class GetUserPlace extends UseCase<Place, void> {
  final UserLocationRepository _userLocationRepository;
  final PlaceRepository _placeRepository;

  const GetUserPlace(
    this._userLocationRepository,
    this._placeRepository,
  )   : assert(_userLocationRepository != null),
        assert(_placeRepository != null);

  @override
  Future<Result<Place, Failure>> call(_) async {
    final result = await _userLocationRepository.getCurrentLocation();
    return result.fold(
      onSuccess: (placeLocation) {
        return _placeRepository.getPlace(placeLocation);
      },
      onFailure: (failure) {
        return FailureResult(failure);
      },
    );
  }
}
