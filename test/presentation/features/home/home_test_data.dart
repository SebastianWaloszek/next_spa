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

const placeWithNoName = PlaceModel(
  id: PlaceIdModel('id3'),
  location: PlaceLocationModel(latitude: 7.8, longitude: 9.10),
  address: AddressModel(
    province: 'province3',
    streetWithNumber: 'streetWithNumber3',
  ),
);

const placeWithNoAddress = PlaceModel(
  id: PlaceIdModel('id4'),
  name: 'name4',
  location: PlaceLocationModel(latitude: 11.0, longitude: 11.1),
);

const placeWithNoLocation = PlaceModel(
  id: PlaceIdModel('id5'),
  name: 'name5',
  address: AddressModel(
    province: 'province5',
    streetWithNumber: 'streetWithNumber5',
  ),
);
