import 'package:flutter/widgets.dart';
import 'package:spa_coding_exercise/common/environment/environment.dart';
import 'package:spa_coding_exercise/common/environment/environment_dev.dart';
import 'package:spa_coding_exercise/common/util/injector.dart';
import 'package:spa_coding_exercise/presentation/app.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());
  Injector.setup();
  runApp(MyApp());
}
