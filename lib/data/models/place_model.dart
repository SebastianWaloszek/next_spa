import 'package:spa_coding_exercise/data/models/id_model.dart';
import 'package:spa_coding_exercise/data/models/location_model.dart';
import 'package:spa_coding_exercise/domain/entities/location.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:meta/meta.dart';
import 'package:spa_coding_exercise/domain/entities/place_id.dart';

class PlaceModel extends Place {
  const PlaceModel({
    @required PlaceId id,
    @required String name,
    @required Location location,
  }) : super(
          id: id,
          name: name,
          location: location,
        );

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: PlaceIdModel.fromJson(json),
      name: json['text'] as String,
      location: LocationModel.fromJson(json),
    );
  }
}
