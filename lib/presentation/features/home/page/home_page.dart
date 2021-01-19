import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_body.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_body_parameters.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePageBody(
      parameters: HomePageBodyParameters(context),
    );
  }
}
