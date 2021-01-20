import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/data/data_sources/user_location_data_source.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/domain/repositories/user_location_repository.dart';

class UserLocationRepositoryImpl implements UserLocationRepository {
  final UserLocationDataSource _dataSource;

  const UserLocationRepositoryImpl(
    this._dataSource,
  ) : assert(_dataSource != null);

  @override
  Future<Result<PlaceLocation, Failure>> getCurrentLocation() {
    return _dataSource.getCurrentLocation();
  }
}
