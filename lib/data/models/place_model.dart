import 'package:spa_coding_exercise/data/models/address_model.dart';
import 'package:spa_coding_exercise/data/models/id_model.dart';
import 'package:spa_coding_exercise/data/models/place_location_model.dart';
import 'package:spa_coding_exercise/domain/entities/address.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:meta/meta.dart';
import 'package:spa_coding_exercise/domain/entities/place_id.dart';

class PlaceModel extends Place {
  const PlaceModel({
    @required PlaceId id,
    @required String name,
    @required PlaceLocation location,
    @required Address address,
  }) : super(
          id: id,
          name: name,
          location: location,
          address: address,
        );

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: PlaceIdModel.fromJson(json),
      name: json['text'] as String,
      location: PlaceLocationModel.fromJson(json),
      address: ModelAddress.fromJson(json),
    );
  }
}
