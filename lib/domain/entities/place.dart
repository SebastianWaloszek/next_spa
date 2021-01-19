import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/domain/entities/location.dart';
import 'package:spa_coding_exercise/domain/entities/place_id.dart';

abstract class Place extends Equatable {
  final PlaceId id;
  final String name;
  final Location location;

  const Place({
    @required this.id,
    @required this.name,
    @required this.location,
  })  : assert(id != null),
        assert(name != null),
        assert(location != null);

  @override
  List<Object> get props => [
        id,
        name,
        location,
      ];
}
