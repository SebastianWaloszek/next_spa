import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/presentation/features/home/bloc/home_page_bloc.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_body.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_body_parameters.dart';
import 'package:spa_coding_exercise/presentation/features/user_location/bloc/user_location_bloc.dart';
import 'package:latlong/latlong.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double _onPlaceSelectedZoom = 14;
  static const double _onGotUserLocationZoom = 13;

  final mapController = MapController();
  Place selectedPlace;

  @override
  void initState() {
    super.initState();
    _loadUserLocation();
  }

  void _loadUserLocation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<UserLocationBloc>(context).add(LoadUserLocationEvent());
    });
  }

  void _loadSpaPlaces(PlaceLocation location) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomePageBloc>(context).add(LoadSpaPlacesEvent(
        location: location,
      ));
    });
  }

  void _onPlaceSelected(Place place) {
    setState(() {
      if (selectedPlace == place) {
        selectedPlace = null;
      } else {
        selectedPlace = place;
        _focusOnLocation(place.location, zoom: _onPlaceSelectedZoom);
      }
    });
  }

  void _focusOnLocation(
    PlaceLocation placeLocation, {
    double zoom = _onGotUserLocationZoom,
  }) {
    mapController.move(
      LatLng(placeLocation.latitude, placeLocation.longitude),
      zoom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLocationBloc, UserLocationState>(
      listener: (context, state) {
        if (state is LoadedUserLocationState) {
          _loadSpaPlaces(state.userPlace.location);
          _focusOnLocation(state.userPlace.location);
        }
      },
      builder: (BuildContext context, UserLocationState userLocationState) {
        return BlocBuilder<HomePageBloc, HomePageState>(
          builder: (BuildContext context, HomePageState state) {
            return HomePageBody(
              parameters: HomePageBodyParameters(
                context,
                spaPlaces: state.spaPlaces,
                userPlace: userLocationState.userPlace,
                selectedPlace: selectedPlace,
                mapController: mapController,
                getCurrentLocation: _loadUserLocation,
                onPlaceSelected: _onPlaceSelected,
              ),
            );
          },
        );
      },
    );
  }
}
