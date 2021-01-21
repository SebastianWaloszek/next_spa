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
    this.name,
    this.location,
    this.address,
  }) : assert(id != null);

  bool get hasName => name != null;
  bool get hasLocation => location != null;
  bool get hasAddress => address != null;

  @override
  List<Object> get props => [
        id,
        name,
        location,
        address,
      ];
}
