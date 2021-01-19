import 'dart:ui';

import 'package:flutter/material.dart';

abstract class LightThemeColors {
  static Color get primaryContent => const Color(0xFF222529);
  static Color get secondaryContent => const Color(0xFFBEBDBD);
  static Color get primaryAccent => const Color(0xFF809D7A);
  static Color get secondaryAccent => const Color(0xFF555555);
  static Color get buttonContent => const Color(0xFFFFFFFF);
  static Color get background => const Color(0xFFFFFFFF);
  static Color get shadow => const Color(0xFF000000).withOpacity(0.25);
}

abstract class DarkThemeColors {
  static Color get primaryContent => const Color(0xFFE1E1E1);
  static Color get secondaryContent => const Color(0xFFA5A5A5);
  static Color get primaryAccent => const Color(0xFF73936C);
  static Color get secondaryAccent => const Color(0xFF555555);
  static Color get buttonContent => const Color(0xFFFFFFFF);
  static Color get background => const Color(0xFF181818);
  static Color get shadow => const Color(0xFF000000).withOpacity(0.25);
}
