import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:spa_coding_exercise/common/util/extensions/widget_extensions.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/presentation/theme/app_text_styles.dart';
import 'package:spa_coding_exercise/presentation/theme/app_theme_constants.dart';
import 'package:spa_coding_exercise/presentation/theme/color/app_colors.dart';
import 'package:spa_coding_exercise/presentation/localization/generated/l10n.dart';
import 'package:spa_coding_exercise/presentation/theme/device.dart';
import 'package:latlong/latlong.dart';

class UserLocationMarker extends Marker {
  UserLocationMarker(
    BuildContext context, {
    @required Place place,
  })  : assert(place != null),
        super(
          width: 120,
          height: 102,
          point: LatLng(place.location.latitude, place.location.longitude),
          builder: (markerContext) {
            return Column(
              children: [
                _YouAreHere(),
                const SizedBox(height: 10),
                _UserIcon(),
                const SizedBox(height: 10),
                Text(
                  place.name,
                  style: AppTextStyles.subtitle2(
                    context,
                    color: AppColors.primaryContent(context),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )
              ],
            );
          },
        );
}

class _YouAreHere extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.background(context),
        borderRadius: AppThemeConstants.borderRadius,
        border: Device.isLightTheme(context)
            ? null
            : Border.all(color: AppColors.secondaryContent(context)),
        boxShadow: Device.isLightTheme(context) ? cellBoxShadow(context) : [],
      ),
      child: Text(
        AppLocalizations.of(context).youAreHere,
        style: AppTextStyles.body2(context),
      ),
    );
  }
}

class _UserIcon extends StatelessWidget {
  static const double _size = 24;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/271/man_1f468.png',
      width: _size,
      height: _size,
    );
  }
}
