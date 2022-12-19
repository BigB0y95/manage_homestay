import 'package:manager_homestay_app/utils/commons.dart';

class Homestay {
  int? id;
  String? name;
  String? address;
  DateTime? operationStartDate;

  Homestay(
      {required this.id,
      required this.name,
      required this.address,
      required this.operationStartDate});

  Homestay.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    address = json['address'] ?? '';
    operationStartDate = json['operationStartDate'] != null
        ? Commons.formatDateTimeZone(json['operationStartDate'] as String)
        : null;
    ;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['address'] = address;
    map['operationStartDate'] = operationStartDate;
    return map;
  }
}
