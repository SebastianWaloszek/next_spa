import 'package:location/location.dart';
import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/result/failure_result.dart';
import 'package:spa_coding_exercise/common/result/result.dart';
import 'package:spa_coding_exercise/common/result/success_result.dart';
import 'package:spa_coding_exercise/data/data_sources/user_location_data_source.dart';
import 'package:spa_coding_exercise/data/models/place_location_model.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';

class LocalUserLocationDataSource implements UserLocationDataSource {
  final Location _location;

  LocalUserLocationDataSource(
    this._location,
  ) : assert(
          _location != null,
        );

  Future<bool> _checkIfLocationServiceEnabled() async {
    bool serviceEnabled;
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
    }
    return serviceEnabled;
  }

  Future<bool> _checkIfPermissionGranted() async {
    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.deniedForever) {
      return false;
    } else if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      return permissionGranted == PermissionStatus.granted ||
          permissionGranted == PermissionStatus.grantedLimited;
    } else {
      return true;
    }
  }

  @override
  Future<Result<PlaceLocation, Failure>> getCurrentLocation() async {
    final serviceEnabled = await _checkIfLocationServiceEnabled();
    final permissionGranted = await _checkIfPermissionGranted();

    if (serviceEnabled && permissionGranted) {
      final locationData = await _location.getLocation();
      return SuccessResult(
        PlaceLocationModel(
          latitude: locationData.latitude,
          longitude: locationData.longitude,
        ),
      );
    } else {
      return FailureResult(UserLocationFailure());
    }
  }
}
