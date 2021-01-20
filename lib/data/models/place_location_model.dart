import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:meta/meta.dart';

class PlaceLocationModel extends PlaceLocation {
  const PlaceLocationModel({
    @required double latitude,
    @required double longitude,
  }) : super(
          latitude: latitude,
          longitude: longitude,
        );

  factory PlaceLocationModel.fromJson(Map<String, dynamic> json) {
    final centerCoordinates = json['center'] as List<dynamic>;
    return PlaceLocationModel(
      latitude: centerCoordinates[1] as double,
      longitude: centerCoordinates[0] as double,
    );
  }
}
