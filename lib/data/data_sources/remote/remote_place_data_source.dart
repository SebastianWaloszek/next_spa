import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/data/data_sources/place_data_source.dart';
import 'package:spa_coding_exercise/data/network/network_service.dart';
import 'package:spa_coding_exercise/data/network/requests/get_place_request.dart';
import 'package:spa_coding_exercise/domain/entities/location.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';

class RemotePlaceDataSource extends PlaceDataSource {
  final NetworkService _networkService;

  const RemotePlaceDataSource(this._networkService)
      : assert(_networkService != null);

  @override
  Future<Result<Place, Failure>> getPlace(Location location) {
    final request = GetPlaceRequest(location);
    return _networkService.make(request) as Future<Result<Place, Failure>>;
  }
}
