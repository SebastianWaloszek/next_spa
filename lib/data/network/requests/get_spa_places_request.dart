import 'package:spa_coding_exercise/common/parameters/get_places_parameters.dart';
import 'package:spa_coding_exercise/data/models/place_model.dart';
import 'package:spa_coding_exercise/data/network/request.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';

class GetSpaPlacesRequest extends Request<List<Place>> {
  GetSpaPlacesRequest(GetPlacesParameters parameters)
      : super(
          path: 'mapbox.places/spa .json',
          queryParameters: {
            'limit': parameters.limit,
            'autocomplete': true,
            'types': 'poi',
            'proximity':
                '${parameters.nearLocation.longitude}, ${parameters.nearLocation.latitude}'
          },
        );

  @override
  List<Place> createResponse(dynamic json) => List<PlaceModel>.from(
        (json['features'] as List<dynamic>).map(
          (feature) => PlaceModel.fromJson(feature as Map<String, dynamic>),
        ),
      );
}
