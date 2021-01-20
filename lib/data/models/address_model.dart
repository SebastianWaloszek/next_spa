import 'package:spa_coding_exercise/domain/entities/address.dart';

class ModelAddress extends Address {
  const ModelAddress({
    String streetWithNumber,
    String province,
  }) : super(
          streetWithNumber: streetWithNumber,
          province: province,
        );

  factory ModelAddress.fromJson(Map<String, dynamic> json) {
    final properties = json['properties'];
    final context = json['context'] as List;
    final shouldHaveProvince = context != null && context.length >= 2;
    return ModelAddress(
      streetWithNumber:
          properties != null ? properties['address'] as String : null,
      province: shouldHaveProvince ? context[1]['text'] as String : null,
    );
  }
}
