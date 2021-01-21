import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:spa_coding_exercise/common/util/injector.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_body_parameters.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_keys.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/current_location_button.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/nearby_places_indicator.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/place_details_modal.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/spa_map.dart';
import 'package:spa_coding_exercise/presentation/features/user_location/bloc/user_location_bloc.dart';
import 'package:spa_coding_exercise/presentation/page/page_body.dart';
import 'package:spa_coding_exercise/presentation/theme/app_theme_constants.dart';
import 'package:spa_coding_exercise/presentation/localization/generated/l10n.dart';
import 'package:latlong/latlong.dart';

class HomePageBody extends PageBody<HomePageBodyParameters> {
  const HomePageBody({
    @required HomePageBodyParameters parameters,
  })  : assert(parameters != null),
        super(parameters);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  static const double _stackTopPadding = 40;

  HomePageBodyParameters get parameters => widget.parameters;

  final _userLocationBloc = Injector.resolve<UserLocationBloc>();

  Place _selectedPlace;
  final mapController = MapController();

  void _onPlaceSelected(Place place) {
    setState(() {
      if (_selectedPlace == place) {
        _selectedPlace = null;
      } else {
        _selectedPlace = place;
        _focusOnLocation(place.location, zoom: 14);
      }
    });
  }

  void _focusOnLocation(PlaceLocation placeLocation, {double zoom = 13}) {
    mapController.move(
      LatLng(
        placeLocation.latitude,
        placeLocation.longitude,
      ),
      zoom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserLocationBloc, UserLocationState>(
      cubit: _userLocationBloc,
      listener: (BuildContext context, UserLocationState state) {
        if (state is LoadedUserLocationState) {
          _focusOnLocation(state.userPlace.location);
        }
      },
      child: Scaffold(
        key: const Key(HomePageKeys.homePageScaffold),
        body: Stack(
          children: [
            SpaMap(
              key: const Key(HomePageKeys.spaMap),
              mapController: mapController,
              spaPlaces: parameters.spaPlaces,
              userPlace: parameters.userPlace,
              selectedPlace: _selectedPlace,
              onPlaceSelected: _onPlaceSelected,
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
                _userLocationBloc,
                key: const Key(HomePageKeys.currentLocationButton),
                onPressed: parameters.getCurrentLocation,
              ),
            ),
            if (_selectedPlace != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: PlaceDetailsModal(
                  key: const Key(HomePageKeys.placeDetailsModal),
                  place: _selectedPlace,
                  userLocation: parameters.userPlace,
                ),
              )
          ],
        ),
      ),
    );
  }
}
