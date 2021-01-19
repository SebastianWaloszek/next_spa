import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/data/data_sources/place_data_source.dart';
import 'package:spa_coding_exercise/domain/entities/location.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/repositories/place_repository.dart';

class PlaceRepositoryImpl extends PlaceRepository {
  final PlaceDataSource _dataSource;

  const PlaceRepositoryImpl(this._dataSource) : assert(_dataSource != null);

  @override
  Future<Result<Place, Failure>> getPlace(Location location) {
    return _dataSource.getPlace(location);
  }
}
