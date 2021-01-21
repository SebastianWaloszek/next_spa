import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:spa_coding_exercise/common/util/extensions/widget_extensions.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_keys.dart';
import 'package:spa_coding_exercise/presentation/theme/app_icons.dart';
import 'package:spa_coding_exercise/presentation/theme/app_text_styles.dart';
import 'package:spa_coding_exercise/presentation/theme/app_theme_constants.dart';
import 'package:spa_coding_exercise/presentation/theme/color/app_colors.dart';

class SpaLocationMarker extends Marker {
  SpaLocationMarker({
    @required int id,
    @required Place place,
    bool selected = false,
    @required VoidCallback onTap,
  })  : assert(id != null),
        assert(place != null),
        assert(onTap != null),
        super(
          width: 75,
          height: 70,
          point: LatLng(place.location.latitude, place.location.longitude),
          builder: (_) => SpaLocationIndicator(
            key: Key(HomePageKeys.spaIndicator(id)),
            place: place,
            selected: selected,
            onTap: onTap,
          ),
        );
}

class SpaLocationIndicator extends StatelessWidget {
  final Place place;
  final bool selected;
  final VoidCallback onTap;

  const SpaLocationIndicator({
    Key key,
    @required this.place,
    @required this.selected,
    @required this.onTap,
  })  : assert(place != null),
        assert(selected != null),
        assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkResponse(
        onTap: onTap,
        child: Column(
          children: [
            _MarkerIcon(markerSelected: selected),
            const SizedBox(height: 5),
            Text(
              place.name,
              style: AppTextStyles.subtitle2(
                context,
                color: AppColors.primaryContent(context)
                    .withOpacity(selected ? 1 : 0.55),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class _MarkerIcon extends StatelessWidget {
  static const double _size = 35;

  final bool markerSelected;

  const _MarkerIcon({
    Key key,
    @required this.markerSelected,
  })  : assert(markerSelected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        boxShadow: markerSelected ? cellBoxShadow(context) : [],
        color: AppColors.primaryAccent(context).withOpacity(
          markerSelected ? 1 : 0.2,
        ),
        borderRadius: AppThemeConstants.borderRadius,
      ),
      child: Icon(
        AppIcons.heat,
        color: markerSelected
            ? AppColors.buttonContent(context)
            : AppColors.primaryAccent(context),
      ),
    );
  }
}
