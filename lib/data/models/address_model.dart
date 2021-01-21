import 'package:spa_coding_exercise/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    String streetWithNumber,
    String province,
  }) : super(
          streetWithNumber: streetWithNumber,
          province: province,
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    final properties = json['properties'];
    final context = json['context'] as List;
    final shouldHaveProvince = context != null && context.length >= 2;
    return AddressModel(
      streetWithNumber:
          properties != null ? properties['address'] as String : null,
      province: shouldHaveProvince ? context[1]['text'] as String : null,
    );
  }
}
