import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/domain/entities/address.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/domain/entities/place_id.dart';

abstract class Place extends Equatable {
  final PlaceId id;
  final String name;
  final PlaceLocation location;
  final Address address;

  const Place({
    @required this.id,
    @required this.name,
    @required this.location,
    @required this.address,
  })  : assert(id != null),
        assert(name != null),
        assert(location != null),
        assert(address != null);

  @override
  List<Object> get props => [
        id,
        name,
        location,
        address,
      ];
}
