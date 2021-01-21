import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:spa_coding_exercise/common/environment/environment.dart';
import 'package:spa_coding_exercise/common/util/extensions/iterable_extensions.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:latlong/latlong.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/marker/spa_location_marker.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/marker/user_location_marker.dart';
import 'package:spa_coding_exercise/presentation/theme/app_theme_constants.dart';
import 'package:spa_coding_exercise/presentation/theme/color/app_colors.dart';

class SpaMap extends StatelessWidget {
  static const double _initialMapZoom = 2;

  final MapController mapController;

  final List<Place> spaPlaces;
  final Place userPlace;

  final Place selectedPlace;
  final void Function(Place) onPlaceSelected;

  const SpaMap({
    Key key,
    this.mapController,
    this.spaPlaces,
    this.userPlace,
    this.selectedPlace,
    @required this.onPlaceSelected,
  })  : assert(onPlaceSelected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: _getMapOptions(),
      mapController: mapController,
      layers: [
        _getTileLayerOptions(context),
        if (spaPlaces.isNotNullOrEmpty) _getMarkerLayerOptions(context),
      ],
    );
  }

  MapOptions _getMapOptions() {
    return MapOptions(
      center: userPlace != null
          ? LatLng(userPlace.location.latitude, userPlace.location.longitude)
          : null,
      zoom: _initialMapZoom,
    );
  }

  TileLayerOptions _getTileLayerOptions(BuildContext context) {
    return TileLayerOptions(
      backgroundColor: AppColors.background(context),
      urlTemplate: AppThemeConstants.getMapUrl(context),
      additionalOptions: {
        'accessToken': Environment.current.accessToken,
      },
    );
  }

  MarkerLayerOptions _getMarkerLayerOptions(BuildContext context) {
    final markers = <Marker>[];
    for (var index = 0; index < spaPlaces.length; index++) {
      final place = spaPlaces.elementAt(index);
      markers.add(
        SpaLocationMarker(
          id: index,
          place: place,
          selected: place == selectedPlace,
          onTap: () => onPlaceSelected(place),
        ),
      );
    }
    if (userPlace != null) {
      markers.add(UserLocationMarker(place: userPlace));
    }
    return MarkerLayerOptions(
      markers: markers,
    );
  }
}
