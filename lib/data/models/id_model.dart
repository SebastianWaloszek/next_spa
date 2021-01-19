import 'package:spa_coding_exercise/domain/entities/place_id.dart';

class PlaceIdModel extends PlaceId {
  const PlaceIdModel(String value) : super(value);

  factory PlaceIdModel.fromJson(Map<String, dynamic> json) {
    return PlaceIdModel(json['id'] as String);
  }
}
