import 'package:equatable/equatable.dart';
import 'package:spa_coding_exercise/domain/entities/location.dart';
import 'package:meta/meta.dart';

class GetPlacesParameters extends Equatable {
  final int limit;
  final Location nearLocation;

  const GetPlacesParameters({
    @required this.nearLocation,
    this.limit = 6,
  });

  @override
  List<Object> get props => [
        nearLocation,
        limit,
      ];
}
