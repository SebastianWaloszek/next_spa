import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';

import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/data/data_sources/local/local_user_location_data_source.dart';
import 'package:spa_coding_exercise/data/data_sources/user_location_data_source.dart';

import '../../repository_test_data.dart';

class LocationMock extends Mock implements Location {}

void main() {
  UserLocationDataSource dataSource;
  final location = LocationMock();

  final locationData = LocationData.fromMap(
    {
      'latitude': placeLocation.latitude,
      'longitude': placeLocation.longitude,
    },
  );

  setUp(() {
    dataSource = LocalUserLocationDataSource(location);
  });

  group('LocalUserLocationDataSource tests', () {
    test('Should return location when service enabled and has permission',
        () async {
      when(location.serviceEnabled()).thenAnswer(
        (_) async => true,
      );
      when(location.hasPermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );
      when(location.getLocation()).thenAnswer(
        (_) async => locationData,
      );
      final result = await dataSource.getCurrentLocation();
      result.fold(
        onSuccess: (placeLocation) {
          expect(result, successfulUserLocationResult);
        },
        onFailure: (_) {
          throw Exception('data source should not return failure');
        },
      );
    });

    test(
        'Should return location when service enabled and has limited permission',
        () async {
      when(location.serviceEnabled()).thenAnswer(
        (_) async => true,
      );
      when(location.hasPermission()).thenAnswer(
        (_) async => PermissionStatus.grantedLimited,
      );
      when(location.getLocation()).thenAnswer(
        (_) async => locationData,
      );
      final result = await dataSource.getCurrentLocation();
      result.fold(
        onSuccess: (placeLocation) {
          expect(result, successfulUserLocationResult);
        },
        onFailure: (_) {
          throw Exception('data source should not return failure');
        },
      );
    });

    test('Should return location when service not enabled and has permission',
        () async {
      when(location.serviceEnabled()).thenAnswer(
        (_) async => false,
      );
      when(location.requestService()).thenAnswer(
        (_) async => true,
      );
      when(location.hasPermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );
      when(location.getLocation()).thenAnswer(
        (_) async => locationData,
      );
      final result = await dataSource.getCurrentLocation();
      result.fold(
        onSuccess: (placeLocation) {
          expect(result, successfulUserLocationResult);
        },
        onFailure: (_) {
          throw Exception('data source should not return failure');
        },
      );
    });

    test(
        'Should return failure when service not enabled and request denied and has permission',
        () async {
      when(location.serviceEnabled()).thenAnswer(
        (_) async => false,
      );
      when(location.requestService()).thenAnswer(
        (_) async => false,
      );
      when(location.hasPermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );
      when(location.getLocation()).thenAnswer(
        (_) async => locationData,
      );
      final result = await dataSource.getCurrentLocation();
      result.fold(
        onSuccess: (_) {
          throw Exception('data source should not return success result');
        },
        onFailure: (failure) {
          expect(failure, isNotNull);
        },
      );
    });

    test(
        'Should return failure when service enabled and has permission but get location fails',
        () async {
      when(location.serviceEnabled()).thenAnswer(
        (_) async => true,
      );
      when(location.hasPermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );
      when(location.getLocation()).thenAnswer(
        (_) async => null,
      );
      final result = await dataSource.getCurrentLocation();
      result.fold(
        onSuccess: (_) {
          throw Exception('data source should not return success result');
        },
        onFailure: (failure) {
          expect(failure, isNotNull);
        },
      );
    });

    test(
        'Should return failure when service enabled and permission denied forever',
        () async {
      when(location.serviceEnabled()).thenAnswer(
        (_) async => true,
      );
      when(location.hasPermission()).thenAnswer(
        (_) async => PermissionStatus.deniedForever,
      );
      final result = await dataSource.getCurrentLocation();
      result.fold(
        onSuccess: (_) {
          throw Exception('data source should not return success result');
        },
        onFailure: (failure) {
          expect(failure, isNotNull);
        },
      );
    });

    test('Should return success when service enabled and received permission',
        () async {
      when(location.serviceEnabled()).thenAnswer(
        (_) async => true,
      );
      when(location.hasPermission()).thenAnswer(
        (_) async => PermissionStatus.denied,
      );
      when(location.requestPermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );
      when(location.getLocation()).thenAnswer(
        (_) async => locationData,
      );
      final result = await dataSource.getCurrentLocation();
      result.fold(
        onSuccess: (placeLocation) {
          expect(result, successfulUserLocationResult);
        },
        onFailure: (_) {
          throw Exception('data source should not return failure');
        },
      );
    });

    test(
        'Should return success when service enabled and received limited permission',
        () async {
      when(location.serviceEnabled()).thenAnswer(
        (_) async => true,
      );
      when(location.hasPermission()).thenAnswer(
        (_) async => PermissionStatus.denied,
      );
      when(location.requestPermission()).thenAnswer(
        (_) async => PermissionStatus.grantedLimited,
      );
      when(location.getLocation()).thenAnswer(
        (_) async => locationData,
      );
      final result = await dataSource.getCurrentLocation();
      result.fold(
        onSuccess: (placeLocation) {
          expect(result, successfulUserLocationResult);
        },
        onFailure: (_) {
          throw Exception('data source should not return failure');
        },
      );
    });

    test('Should return failure when exception is thrown', () async {
      when(location.serviceEnabled()).thenAnswer(
        (_) async => true,
      );
      when(location.hasPermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );
      when(location.getLocation()).thenThrow(
        (_) async => PlatformException(code: 'code'),
      );
      final result = await dataSource.getCurrentLocation();
      result.fold(
        onSuccess: (_) {
          throw Exception('data source should not return success result');
        },
        onFailure: (failure) {
          expect(failure, isNotNull);
        },
      );
    });
  });
}
