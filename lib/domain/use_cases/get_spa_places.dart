import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/parameters/get_places_parameters.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/repositories/spa_repository.dart';
import 'package:spa_coding_exercise/domain/use_cases/use_case.dart';

class GetSpaPlaces extends UseCase<List<Place>, GetPlacesParameters> {
  final SpaRepository _repository;

  const GetSpaPlaces(this._repository) : assert(_repository != null);

  @override
  Future<Result<List<Place>, Failure>> call(GetPlacesParameters parameters) {
    return _repository.getPlaces(parameters);
  }
}
