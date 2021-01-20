import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/parameters/get_places_parameters.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/data/data_sources/spa_data_source.dart';
import 'package:spa_coding_exercise/data/network/network_service.dart';
import 'package:spa_coding_exercise/data/network/requests/get_spa_places_request.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';

class RemoteSpaDataSource implements SpaDataSource {
  final NetworkService _networkService;

  const RemoteSpaDataSource(this._networkService)
      : assert(
          _networkService != null,
        );

  @override
  Future<Result<List<Place>, Failure>> getPlaces(
    GetPlacesParameters parameters,
  ) {
    final request = GetSpaPlacesRequest(parameters);
    return _networkService.make(request)
        as Future<Result<List<Place>, Failure>>;
  }
}
