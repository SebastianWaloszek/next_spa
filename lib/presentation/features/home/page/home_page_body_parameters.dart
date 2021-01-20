import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/presentation/page/page_body_parameters.dart';

class HomePageBodyParameters extends PageBodyParameters {
  final List<Place> spaPlaces;
  final Place userPlace;

  final VoidCallback getCurrentLocation;

  HomePageBodyParameters(
    BuildContext context, {
    this.spaPlaces,
    this.userPlace,
    @required this.getCurrentLocation,
  })  : assert(getCurrentLocation != null),
        super(context: context);
}
