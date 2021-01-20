import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/presentation/theme/app_theme_constants.dart';
import 'package:spa_coding_exercise/presentation/theme/color/app_colors.dart';

extension WidgetExtensions on Widget {
  List<BoxShadow> cellBoxShadow(BuildContext context) {
    return [
      BoxShadow(
        color: AppColors.shadow(context),
        offset: const Offset(0, 2),
        blurRadius: AppThemeConstants.shadowBlurRadius,
      )
    ];
  }
}
