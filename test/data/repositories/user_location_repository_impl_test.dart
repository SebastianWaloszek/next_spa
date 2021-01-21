import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/data/repositories/user_location_repository_impl.dart';
import 'package:spa_coding_exercise/domain/repositories/user_location_repository.dart';

import '../../data/repository_test_data.dart';

void main() {
  UserLocationRepository repository;
  final dataSource = UserLocationDataSourceMock();

  setUp(() {
    repository = UserLocationRepositoryImpl(dataSource);
  });

  test('Should call data source when getting user current location', () async {
    when(dataSource.getCurrentLocation()).thenAnswer(
      (_) async => successfulUserLocationResult,
    );
    final result = await repository.getCurrentLocation();
    verify(dataSource.getCurrentLocation()).called(1);
    expect(result, successfulUserLocationResult);
  });
}
