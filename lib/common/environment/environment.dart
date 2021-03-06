abstract class Environment {
  static Environment _current;

  static Environment get current => _current;

  static void setCurrent(Environment environment) {
    _current ??= environment;
  }

  String get baseUrl;

  String get accessToken;

  String get lightMapTemplateUrl;

  String get darkMapTemplateUrl;
}
