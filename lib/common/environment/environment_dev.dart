import 'environment.dart';

class DevelopmentEnvironment implements Environment {
  @override
  String get baseUrl => 'https://api.mapbox.com/geocoding/v5/';

  @override
  String get accessToken => ''; // TODO Add access token
}
