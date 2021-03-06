import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/presentation/localization/localization.dart';

class LocalizedMaterialApp extends StatelessWidget {
  final Widget child;

  const LocalizedMaterialApp({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: child,
      ),
      localizationsDelegates: localizationDelegates,
    );
  }
}
