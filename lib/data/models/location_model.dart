import 'package:spa_coding_exercise/domain/entities/location.dart';
import 'package:meta/meta.dart';

class LocationModel extends Location {
  const LocationModel({
    @required double latitude,
    @required double longitude,
  }) : super(
          latitude: latitude,
          longitude: longitude,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    final centerCoordinates = json['center'] as List<dynamic>;
    return LocationModel(
      latitude: centerCoordinates[1] as double,
      longitude: centerCoordinates[0] as double,
    );
  }
}
