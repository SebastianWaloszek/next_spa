import 'package:spa_coding_exercise/common/util/extensions/iterable_extensions.dart';
import 'package:spa_coding_exercise/data/models/place_model.dart';
import 'package:spa_coding_exercise/data/network/request.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';

class GetPlaceRequest extends Request<Place> {
  GetPlaceRequest(PlaceLocation location)
      : super(
          path: 'mapbox.places/${location.longitude},${location.latitude}.json',
        );

  @override
  Place createResponse(dynamic json) {
    final features = json['features'] as List<dynamic>;
    if (features.isNotNullOrEmpty) {
      return PlaceModel.fromJson(features.first as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}
