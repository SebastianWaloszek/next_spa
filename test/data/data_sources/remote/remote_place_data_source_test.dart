import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/data/data_sources/place_data_source.dart';
import 'package:spa_coding_exercise/data/data_sources/remote/remote_place_data_source.dart';
import 'package:spa_coding_exercise/data/network/requests/get_place_request.dart';

import '../../network_test_data.dart';
import '../../repository_test_data.dart';

void main() {
  PlaceDataSource dataSource;
  final networkService = NetworkServiceMock();

  setUp(() {
    dataSource = RemotePlaceDataSource(networkService);
  });

  test('Should call network service when getting place', () async {
    when(networkService.make(any)).thenAnswer(
      (_) async => successfulPlaceResult,
    );
    final result = await dataSource.getPlace(placeLocation);
    final request = verify(networkService.make(captureAny)).captured.single;
    expect(request, GetPlaceRequest(placeLocation));
    expect(result, successfulPlaceResult);
  });
}
