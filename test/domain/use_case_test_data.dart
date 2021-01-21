import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/domain/use_cases/get_location_place.dart';
import 'package:spa_coding_exercise/domain/use_cases/get_spa_places.dart';
import 'package:spa_coding_exercise/domain/use_cases/get_user_place.dart';

class GetLocationPlaceMock extends Mock implements GetLocationPlace {}

class GetSpaPlacesMock extends Mock implements GetSpaPlaces {}

class GetUserPlaceMock extends Mock implements GetUserPlace {}
