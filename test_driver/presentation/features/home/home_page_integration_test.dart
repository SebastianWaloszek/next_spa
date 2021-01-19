import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home page integration tests - ', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });
  });
}
