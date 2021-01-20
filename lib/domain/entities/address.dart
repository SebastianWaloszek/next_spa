import 'package:equatable/equatable.dart';

abstract class Address extends Equatable {
  final String streetWithNumber;
  final String province;

  const Address({
    this.streetWithNumber,
    this.province,
  }) : assert(streetWithNumber != null || province != null);

  String get combined {
    if (streetWithNumber != null && province != null) {
      return '$streetWithNumber, $province';
    } else if (streetWithNumber != null) {
      return streetWithNumber;
    } else if (province != null) {
      return province;
    } else {
      return null;
    }
  }

  @override
  List<Object> get props => [
        streetWithNumber,
        province,
      ];
}
