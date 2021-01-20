import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/common/util/extensions/widget_extensions.dart';
import 'package:spa_coding_exercise/presentation/theme/app_text_styles.dart';
import 'package:spa_coding_exercise/presentation/theme/app_theme_constants.dart';
import 'package:spa_coding_exercise/presentation/theme/color/app_colors.dart';
import 'package:spa_coding_exercise/presentation/widgets/animated_number_text.dart';

class NearbyPlacesIndicator extends StatelessWidget {
  final int count;
  final String description;

  const NearbyPlacesIndicator({
    Key key,
    @required this.count,
    @required this.description,
  })  : assert(count != null),
        assert(description != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * AppThemeConstants.scaleFactor,
      child: Stack(
        children: [
          _DescriptionContainer(description: description),
          _NumberContainer(count: count),
        ],
      ),
    );
  }
}

class _NumberContainer extends StatelessWidget {
  final int count;

  const _NumberContainer({
    Key key,
    @required this.count,
  })  : assert(count != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size.width * AppThemeConstants.scaleFactor;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: AppThemeConstants.borderRadius,
        color: AppColors.primaryAccent(context),
        border: Border.all(
          color: AppColors.buttonContent(context),
          width: 2,
        ),
      ),
      child: Center(
        child: AnimatedNumberText(
          number: count,
          textStyle: AppTextStyles.headline2(
            context,
            color: AppColors.buttonContent(context),
          ),
        ),
      ),
    );
  }
}

class _DescriptionContainer extends StatelessWidget {
  final String description;

  const _DescriptionContainer({
    Key key,
    @required this.description,
  })  : assert(description != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * AppThemeConstants.scaleFactor,
      padding: EdgeInsets.only(
        left:
            MediaQuery.of(context).size.width * AppThemeConstants.scaleFactor +
                8,
        top: 10,
        bottom: 10,
        right: 17,
      ),
      decoration: BoxDecoration(
        borderRadius: AppThemeConstants.borderRadius,
        color: AppColors.background(context),
        boxShadow: cellBoxShadow(context),
        border: Border.all(
          color: AppColors.buttonContent(context),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          description,
          style: AppTextStyles.body1(
            context,
            color: AppColors.primaryContent(context),
          ),
        ),
      ),
    );
  }
}
