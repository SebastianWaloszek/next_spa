import 'environment.dart';

class DevelopmentEnvironment implements Environment {
  @override
  String get baseUrl => 'https://api.mapbox.com/geocoding/v5/mapbox.places/';
}
