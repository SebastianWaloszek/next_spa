import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/data/data_sources/remote/remote_spa_data_source.dart';
import 'package:spa_coding_exercise/data/data_sources/spa_data_source.dart';
import 'package:spa_coding_exercise/data/network/requests/get_spa_places_request.dart';

import '../../network_test_data.dart';
import '../../repository_test_data.dart';

void main() {
  SpaDataSource dataSource;
  final networkService = NetworkServiceMock();

  setUp(() {
    dataSource = RemoteSpaDataSource(networkService);
  });

  test('Should call network service when getting spa places', () async {
    when(networkService.make(any)).thenAnswer(
      (_) async => successfulSpaPlacesResult,
    );
    final result = await dataSource.getPlaces(getPlacesParameters);
    final request = verify(networkService.make(captureAny)).captured.single;
    expect(request, GetSpaPlacesRequest(getPlacesParameters));
    expect(result, successfulSpaPlacesResult);
  });
}
