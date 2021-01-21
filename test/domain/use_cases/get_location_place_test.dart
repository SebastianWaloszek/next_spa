import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/domain/use_cases/get_location_place.dart';

import '../../data/repository_test_data.dart';

void main() {
  GetLocationPlace useCase;
  final placeRepository = PlaceRepositoryMock();

  setUp(() {
    useCase = GetLocationPlace(placeRepository);
  });

  test('Should call repository when getting place location', () async {
    when(placeRepository.getPlace(placeLocation)).thenAnswer(
      (_) async => successfulPlaceResult,
    );
    final result = await useCase.call(placeLocation);
    verify(placeRepository.getPlace(any)).called(1);
    expect(result, successfulPlaceResult);
  });
}
