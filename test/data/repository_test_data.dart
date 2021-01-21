import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/parameters/get_places_parameters.dart';
import 'package:spa_coding_exercise/common/result/failure_result.dart';
import 'package:spa_coding_exercise/common/result/success_result.dart';
import 'package:spa_coding_exercise/data/data_sources/place_data_source.dart';
import 'package:spa_coding_exercise/data/data_sources/spa_data_source.dart';
import 'package:spa_coding_exercise/data/data_sources/user_location_data_source.dart';
import 'package:spa_coding_exercise/data/models/place_location_model.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/domain/repositories/place_repository.dart';
import 'package:spa_coding_exercise/domain/repositories/spa_repository.dart';
import 'package:spa_coding_exercise/domain/repositories/user_location_repository.dart';

import '../utils/test_data.dart';

class PlaceRepositoryMock extends Mock implements PlaceRepository {}

class SpaRepositoryMock extends Mock implements SpaRepository {}

class UserLocationRepositoryMock extends Mock
    implements UserLocationRepository {}

class PlaceDataSourceMock extends Mock implements PlaceDataSource {}

class SpaDataSourceMock extends Mock implements SpaDataSource {}

class UserLocationDataSourceMock extends Mock
    implements UserLocationDataSource {}

final failure = UnexpectedFailure();
const placeLocation = PlaceLocationModel(latitude: 13.37, longitude: 4.20);
final place = TestData.place;
final spaPlaces = TestData.spaPlaces;
const getPlacesParameters = GetPlacesParameters(nearLocation: placeLocation);

final successfulSpaPlacesResult =
    SuccessResult<List<Place>, Failure>(spaPlaces);
final failedSpaPlacesResult = FailureResult<List<Place>, Failure>(failure);

final successfulUserLocationResult =
    SuccessResult<PlaceLocation, Failure>(placeLocation);
final failedUserLocationResult = FailureResult<PlaceLocation, Failure>(failure);

final successfulPlaceResult = SuccessResult<Place, Failure>(place);
final failedPlaceResult = FailureResult<Place, Failure>(failure);
