import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/presentation/page/page_body_parameters.dart';

class HomePageBodyParameters extends PageBodyParameters {
  final List<Place> spaPlaces;
  final Place selectedPlace;

  final Place userPlace;

  final MapController mapController;
  final VoidCallback getCurrentLocation;
  final void Function(Place) onPlaceSelected;

  bool get hasSelectedPlace => selectedPlace != null;

  HomePageBodyParameters(
    BuildContext context, {
    this.spaPlaces,
    this.selectedPlace,
    this.userPlace,
    @required this.mapController,
    @required this.getCurrentLocation,
    @required this.onPlaceSelected,
  })  : assert(mapController != null),
        assert(getCurrentLocation != null),
        assert(onPlaceSelected != null),
        super(context: context);
}
