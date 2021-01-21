import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/domain/use_cases/get_spa_places.dart';

import '../../data/repository_test_data.dart';

void main() {
  GetSpaPlaces useCase;
  final repository = SpaRepositoryMock();

  setUp(() {
    useCase = GetSpaPlaces(repository);
  });

  test('Should call repository when getting spa places', () async {
    when(repository.getPlaces(getPlacesParameters)).thenAnswer(
      (_) async => successfulSpaPlacesResult,
    );
    final result = await useCase.call(getPlacesParameters);
    verify(repository.getPlaces(any)).called(1);
    expect(result, successfulSpaPlacesResult);
  });
}
