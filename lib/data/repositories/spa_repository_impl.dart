import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/parameters/get_places_parameters.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/data/data_sources/spa_data_source.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/repositories/spa_repository.dart';

class SpaRepositoryImpl extends SpaRepository {
  final SpaDataSource _dataSource;

  const SpaRepositoryImpl(this._dataSource)
      : assert(
          _dataSource != null,
        );

  @override
  Future<Result<List<Place>, Failure>> getPlaces(
    GetPlacesParameters parameters,
  ) {
    return _dataSource.getPlaces(parameters);
  }
}
