import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/presentation/theme/app_text_styles.dart';
import 'package:spa_coding_exercise/presentation/theme/app_theme_constants.dart';
import 'package:spa_coding_exercise/presentation/theme/color/app_colors.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final String title;

  final void Function() onTapped;

  final double width;
  final double height;

  const Button({
    Key key,
    this.icon,
    this.title,
    this.width,
    this.height = 55,
    @required this.onTapped,
  })  : assert(icon != null || title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: AppThemeConstants.borderRadius,
          border: Border.all(color: AppColors.buttonContent(context)),
        ),
        child: MaterialButton(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(
              borderRadius: AppThemeConstants.borderRadius),
          color: AppColors.primaryAccent(context),
          onPressed: onTapped,
          child: _ButtonContent(
            icon: icon,
            title: title,
          ),
        ),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ButtonContent({
    Key key,
    this.icon,
    this.title,
  })  : assert(icon != null || title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (icon != null)
          Icon(
            icon,
            color: AppColors.primaryAccent(context),
          ),
        if (title != null)
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: icon != null ? 8 : 0),
              child: Text(
                title,
                style: AppTextStyles.button1(
                  context,
                  color: AppColors.buttonContent(context),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
