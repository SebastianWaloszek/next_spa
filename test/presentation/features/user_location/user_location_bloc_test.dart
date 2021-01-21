import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/presentation/features/user_location/bloc/user_location_bloc.dart';

import '../../../data/repository_test_data.dart';
import '../../../domain/use_case_test_data.dart';

void main() {
  UserLocationBloc bloc;
  final getUserLocation = GetUserPlaceMock();

  setUp(() {
    bloc = UserLocationBloc(getUserLocation);
  });

  blocTest(
    'Should emit correct states when loading user location succeeds',
    build: () {
      when(getUserLocation.call(any)).thenAnswer(
        (_) async => successfulPlaceResult,
      );
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(LoadUserLocationEvent());
    },
    expect: [
      const LoadingUserLocationState(),
      LoadedUserLocationState(userPlace: place),
    ],
  );

  blocTest(
    'Should emit correct states when loading user location fails',
    build: () {
      when(getUserLocation.call(any)).thenAnswer(
        (_) async => failedPlaceResult,
      );
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(LoadUserLocationEvent());
    },
    expect: [
      const LoadingUserLocationState(),
      FailedUserLocationState(failure: failure),
    ],
  );
}
