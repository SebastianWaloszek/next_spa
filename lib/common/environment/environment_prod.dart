import 'environment.dart';

class ProductionEnvironment implements Environment {
  @override
  String get baseUrl => 'https://api.mapbox.com/geocoding/v5/';

  @override
  String get accessToken => ''; // TODO Add access token

  @override
  String get lightMapTemplateUrl => ''; // TODO Add url

  @override
  String get darkMapTemplateUrl => ''; // TODO Add url
}
