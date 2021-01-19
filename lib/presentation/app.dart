import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page.dart';
import 'package:spa_coding_exercise/presentation/localization/localization.dart';
import 'package:spa_coding_exercise/presentation/theme/app_themes.dart';
import 'navigation_routes.dart';

class MyApp extends StatefulWidget {
  static const String appName = 'NextSPA';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.appName,
      theme: appThemes[ThemeMode.light],
      darkTheme: appThemes[ThemeMode.dark],
      routes: navigationRoutes,
      home: HomePage(),
      localizationsDelegates: localizationDelegates,
      supportedLocales: supportedLocales,
    );
  }
}
