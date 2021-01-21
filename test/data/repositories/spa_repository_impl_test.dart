import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/data/repositories/spa_repository_impl.dart';
import 'package:spa_coding_exercise/domain/repositories/spa_repository.dart';

import '../../data/repository_test_data.dart';

void main() {
  SpaRepository repository;
  final dataSource = SpaDataSourceMock();

  setUp(() {
    repository = SpaRepositoryImpl(dataSource);
  });

  test('Should call data source when getting spa places', () async {
    when(dataSource.getPlaces(getPlacesParameters)).thenAnswer(
      (_) async => successfulSpaPlacesResult,
    );
    final result = await repository.getPlaces(getPlacesParameters);
    verify(dataSource.getPlaces(any)).called(1);
    expect(result, successfulSpaPlacesResult);
  });
}
