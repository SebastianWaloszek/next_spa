import 'package:flutter_driver/flutter_driver.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_keys.dart';

abstract class HomePageFinders {
  static final scaffold = find.byValueKey(HomePageKeys.homePageScaffold);
  static final loadingIndicator =
      find.byValueKey(HomePageKeys.loadingIndicator);
  static final spaMap = find.byValueKey(HomePageKeys.spaMap);
  static final nearbyPlacesIndicator =
      find.byValueKey(HomePageKeys.nearbyPlacesIndicator);
  static final placeDetailsModal =
      find.byValueKey(HomePageKeys.placeDetailsModal);
  static final userLocationIndicator =
      find.byValueKey(HomePageKeys.userLocationIndicator);
  static final currentLocationButton =
      find.byValueKey(HomePageKeys.currentLocationButton);

  static SerializableFinder spaIndicator(int index) =>
      find.byValueKey(HomePageKeys.spaIndicator(index));
}
