import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/data/repositories/place_repository_impl.dart';
import 'package:spa_coding_exercise/domain/repositories/place_repository.dart';

import '../../data/repository_test_data.dart';

void main() {
  PlaceRepository repository;
  final dataSource = PlaceDataSourceMock();

  setUp(() {
    repository = PlaceRepositoryImpl(dataSource);
  });

  test('Should call data source when getting place', () async {
    when(dataSource.getPlace(placeLocation)).thenAnswer(
      (_) async => successfulPlaceResult,
    );
    final result = await repository.getPlace(placeLocation);
    verify(dataSource.getPlace(any)).called(1);
    expect(result, successfulPlaceResult);
  });
}
