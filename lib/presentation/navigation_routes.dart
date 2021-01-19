import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page.dart';

final Map<String, WidgetBuilder> navigationRoutes = <String, WidgetBuilder>{
  HomePage.routeName: (BuildContext context) => HomePage(),
};
