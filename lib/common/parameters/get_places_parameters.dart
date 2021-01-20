import 'package:equatable/equatable.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:meta/meta.dart';

class GetPlacesParameters extends Equatable {
  final int limit;
  final PlaceLocation nearLocation;

  const GetPlacesParameters({
    @required this.nearLocation,
    this.limit = 10,
  });

  @override
  List<Object> get props => [
        nearLocation,
        limit,
      ];
}
