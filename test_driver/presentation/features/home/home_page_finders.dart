import 'package:flutter_driver/flutter_driver.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_keys.dart';

abstract class HomePageFinders {
  static final scaffold = find.byValueKey(HomePageKeys.homePageScaffold);
}
