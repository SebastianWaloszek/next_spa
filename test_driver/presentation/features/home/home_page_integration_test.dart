import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'home_page_finders.dart';

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

    Future<void> _waitForMapFullyPresent() async {
      await driver.waitFor(HomePageFinders.spaMap);
      await driver.waitFor(HomePageFinders.nearbyPlacesIndicator);
      await driver.waitFor(HomePageFinders.userLocationIndicator);
    }

    test(
        'Should load map, click on spa item, show modal, click on spa item, hide modal',
        () async {
      await driver.waitFor(HomePageFinders.scaffold);

      await driver.waitForAbsent(HomePageFinders.loadingIndicator);

      await _waitForMapFullyPresent();

      final spaLocationIndicatorFinder = HomePageFinders.spaIndicator(0);
      await driver.waitFor(spaLocationIndicatorFinder);

      await driver.tap(spaLocationIndicatorFinder);

      final placeDetailsModalFinder = HomePageFinders.placeDetailsModal;
      await driver.waitFor(placeDetailsModalFinder);

      await driver.tap(spaLocationIndicatorFinder);

      await driver.waitForAbsent(placeDetailsModalFinder);

      await _waitForMapFullyPresent();
    });

    test(
        'Should load map, click on user location button, load and still display map ',
        () async {
      await driver.waitFor(HomePageFinders.scaffold);

      await driver.waitForAbsent(HomePageFinders.loadingIndicator);

      await _waitForMapFullyPresent();

      await driver.tap(HomePageFinders.currentLocationButton);

      await driver.waitForAbsent(HomePageFinders.loadingIndicator);

      await _waitForMapFullyPresent();
    });
  });
}
