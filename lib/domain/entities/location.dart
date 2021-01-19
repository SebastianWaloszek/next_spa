import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Location extends Equatable {
  final double latitude;
  final double longitude;

  const Location({
    @required this.latitude,
    @required this.longitude,
  })  : assert(latitude != null),
        assert(longitude != null);

  @override
  List<Object> get props => [
        latitude,
        longitude,
      ];
}
