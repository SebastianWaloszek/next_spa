import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/common/environment/environment.dart';
import 'package:spa_coding_exercise/presentation/theme/device.dart';

abstract class AppThemeConstants {
  static const double horizontalPagePadding = 15;
  static const double scaleFactor = 0.13;
  static const double shadowBlurRadius = 10;
  static final BorderRadius borderRadius = BorderRadius.circular(30);

  static String getMapUrl(BuildContext context) {
    if (Device.isNotLightTheme(context)) {
      return Environment.current.darkMapTemplateUrl;
    } else {
      return Environment.current.lightMapTemplateUrl;
    }
  }
}
