import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/domain/entities/address.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/navigate_button.dart';
import 'package:spa_coding_exercise/presentation/theme/app_text_styles.dart';
import 'package:spa_coding_exercise/presentation/theme/app_theme_constants.dart';
import 'package:spa_coding_exercise/presentation/theme/color/app_colors.dart';

class PlaceDetailsModal extends StatelessWidget {
  final Place place;
  final Place userLocation;

  const PlaceDetailsModal({
    Key key,
    @required this.place,
    @required this.userLocation,
  })  : assert(place != null),
        assert(userLocation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemeConstants.horizontalPagePadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.background(context),
        // boxShadow: cellBoxShadow(context),
        borderRadius: BorderRadius.only(
          topLeft: AppThemeConstants.borderRadius.topLeft,
          topRight: AppThemeConstants.borderRadius.topRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 15),
          _DragIndicator(context),
          const Spacer(),
          if (place.name != null)
            Text(
              place.name,
              style: AppTextStyles.headline1(context),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          const SizedBox(height: 30),
          if (place.address.combined != null)
            _FullAddressRow(address: place.address),
          const Spacer(),
          if (userLocation != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppThemeConstants.horizontalPagePadding,
              ),
              child: NavigateButton(
                destination: place,
                userPlace: userLocation,
              ),
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _FullAddressRow extends StatelessWidget {
  final Address address;

  const _FullAddressRow({
    Key key,
    @required this.address,
  })  : assert(address != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on_outlined,
          color: AppColors.primaryAccent(context),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            address.combined,
            style: AppTextStyles.subtitle1(context),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _DragIndicator extends Container {
  _DragIndicator(BuildContext context)
      : super(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.secondaryContent(context),
            borderRadius: BorderRadius.circular(10),
          ),
        );
}
