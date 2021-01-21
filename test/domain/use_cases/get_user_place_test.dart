import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/domain/use_cases/get_user_place.dart';

import '../../data/repository_test_data.dart';

void main() {
  GetUserPlace useCase;
  final userLocationRepository = UserLocationRepositoryMock();
  final placeRepository = PlaceRepositoryMock();

  setUp(() {
    useCase = GetUserPlace(
      userLocationRepository,
      placeRepository,
    );
  });

  group('', () {
    test(
        'Should return place result when getting current user location succeeds',
        () async {
      when(userLocationRepository.getCurrentLocation()).thenAnswer(
        (_) async => successfulUserLocationResult,
      );
      when(placeRepository.getPlace(placeLocation)).thenAnswer(
        (_) async => successfulPlaceResult,
      );
      final result = await useCase.call(null);
      verify(userLocationRepository.getCurrentLocation()).called(1);
      verify(placeRepository.getPlace(any)).called(1);
      expect(result, successfulPlaceResult);
    });

    test(
        'Should return failure result when getting current user location fails',
        () async {
      when(userLocationRepository.getCurrentLocation()).thenAnswer(
        (_) async => failedUserLocationResult,
      );
      final result = await useCase.call(null);
      verify(userLocationRepository.getCurrentLocation()).called(1);
      verifyNever(placeRepository.getPlace(any));
      expect(result, failedPlaceResult);
    });
  });
}
