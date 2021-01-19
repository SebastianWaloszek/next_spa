import 'environment.dart';

class ProductionEnvironment implements Environment {
  @override
  String get baseUrl => 'https://api.mapbox.com/geocoding/v5/';

  @override
  String get accessToken => ''; // TODO Add access token
}
