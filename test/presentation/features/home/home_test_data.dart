import 'package:spa_coding_exercise/data/models/address_model.dart';
import 'package:spa_coding_exercise/data/models/id_model.dart';
import 'package:spa_coding_exercise/data/models/place_location_model.dart';
import 'package:spa_coding_exercise/data/models/place_model.dart';

const place1 = PlaceModel(
  id: PlaceIdModel('id1'),
  name: 'name1',
  location: PlaceLocationModel(latitude: 1.1, longitude: 2.3),
  address: AddressModel(
    province: 'province1',
    streetWithNumber: 'streetWithNumber1',
  ),
);

const place2 = PlaceModel(
  id: PlaceIdModel('id2'),
  name: 'name2',
  location: PlaceLocationModel(latitude: 4.5, longitude: 5.6),
  address: AddressModel(
    province: 'province2',
    streetWithNumber: 'streetWithNumber2',
  ),
);
