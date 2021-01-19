import 'package:flutter/widgets.dart';
import 'package:spa_coding_exercise/common/environment/environment.dart';
import 'package:spa_coding_exercise/common/environment/environment_prod.dart';
import 'package:spa_coding_exercise/common/util/injector.dart';
import 'package:spa_coding_exercise/presentation/app.dart';

void main() {
  Environment.setCurrent(ProductionEnvironment());
  Injector.setup();
  runApp(MyApp());
}
