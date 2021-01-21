import 'package:spa_coding_exercise/data/models/place_model.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';

import '../fixtures/fixture_reader.dart';

abstract class TestData {
  static List<Place> get spaPlaces {
    final json = fixture('spa_places.json');
    return List<PlaceModel>.from(
      (json['features'] as List<dynamic>).map(
        (feature) => PlaceModel.fromJson(feature as Map<String, dynamic>),
      ),
    );
  }

  static Place get place => spaPlaces.first;
}
