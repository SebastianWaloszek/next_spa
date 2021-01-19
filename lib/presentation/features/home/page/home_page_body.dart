import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_body_parameters.dart';
import 'package:spa_coding_exercise/presentation/page/page_body.dart';

class HomePageBody extends PageBody<HomePageBodyParameters> {
  const HomePageBody({
    @required HomePageBodyParameters parameters,
  })  : assert(parameters != null),
        super(parameters);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  HomePageBodyParameters get parameters => widget.parameters;

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Text(
                "Welcome to SPA Coding challenge",
                style: primaryTextTheme.headline5,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
