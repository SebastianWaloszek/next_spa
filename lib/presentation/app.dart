import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_coding_exercise/common/util/injector.dart';
import 'package:spa_coding_exercise/presentation/features/home/bloc/home_page_bloc.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page.dart';
import 'package:spa_coding_exercise/presentation/features/user_location/bloc/user_location_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>(
            create: (_) => Injector.resolve<HomePageBloc>()),
        BlocProvider<UserLocationBloc>(
            create: (_) => Injector.resolve<UserLocationBloc>())
      ],
      child: MaterialApp(
        title: MyApp.appName,
        theme: appThemes[ThemeMode.light],
        darkTheme: appThemes[ThemeMode.dark],
        routes: navigationRoutes,
        home: HomePage(),
        localizationsDelegates: localizationDelegates,
        supportedLocales: supportedLocales,
      ),
    );
  }
}
