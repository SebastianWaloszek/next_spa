import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/data/network/network_info.dart';

class DataConnectionCheckerMock extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfo networkInfo;
  DataConnectionCheckerMock dataConnectionChecker;

  setUp(() {
    dataConnectionChecker = DataConnectionCheckerMock();
    networkInfo = NetworkInfoImpl(dataConnectionChecker);
  });

  test('Should return positive network status is internet is available',
      () async {
    // Build
    when(dataConnectionChecker.hasConnection).thenAnswer((_) async => true);
    // Act
    final result = await networkInfo.isConnected;
    // Expect
    verify(dataConnectionChecker.hasConnection);
    expect(result, true);
    verifyNoMoreInteractions(dataConnectionChecker);
  });

  test('Should return negative network status is internet is not available',
      () async {
    // Build
    when(dataConnectionChecker.hasConnection).thenAnswer((_) async => false);
    // Act
    final result = await networkInfo.isConnected;
    // Expect
    verify(dataConnectionChecker.hasConnection);
    expect(result, false);
    verifyNoMoreInteractions(dataConnectionChecker);
  });
}
