import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_body_parameters.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_keys.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/current_location_button.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/nearby_places_indicator.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/place_details_modal.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/spa_map.dart';
import 'package:spa_coding_exercise/presentation/page/page_body.dart';
import 'package:spa_coding_exercise/presentation/theme/app_theme_constants.dart';
import 'package:spa_coding_exercise/presentation/localization/generated/l10n.dart';

class HomePageBody extends PageBody<HomePageBodyParameters> {
  static const double _stackTopPadding = 40;

  const HomePageBody({
    @required HomePageBodyParameters parameters,
  })  : assert(parameters != null),
        super(parameters);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(HomePageKeys.homePageScaffold),
      body: Stack(
        children: [
          SpaMap(
            key: const Key(HomePageKeys.spaMap),
            mapController: parameters.mapController,
            spaPlaces: parameters.spaPlaces,
            userPlace: parameters.userPlace,
            selectedPlace: parameters.selectedPlace,
            onPlaceSelected: parameters.onPlaceSelected,
          ),
          Positioned(
            top: _stackTopPadding,
            left: AppThemeConstants.horizontalPagePadding,
            child: NearbyPlacesIndicator(
              key: const Key(HomePageKeys.nearbyPlacesIndicator),
              count: parameters.spaPlaces?.length ?? 0,
              description: AppLocalizations.of(context).spasNearYou,
            ),
          ),
          Positioned(
            top: _stackTopPadding,
            right: AppThemeConstants.horizontalPagePadding,
            child: CurrentLocationButton(
              key: const Key(HomePageKeys.currentLocationButton),
              onPressed: parameters.getCurrentLocation,
            ),
          ),
          if (parameters.hasSelectedPlace)
            Align(
              alignment: Alignment.bottomCenter,
              child: PlaceDetailsModal(
                key: const Key(HomePageKeys.placeDetailsModal),
                place: parameters.selectedPlace,
                userLocation: parameters.userPlace,
              ),
            )
        ],
      ),
    );
  }
}
