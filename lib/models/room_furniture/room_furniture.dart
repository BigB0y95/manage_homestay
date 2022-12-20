import 'package:manager_homestay_app/utils/commons.dart';

class RoomFurniture {
  int? id;
  String? name;
  int? number;
  double? price;
  int? status; // 0.tốt - 1.có hư hỏng nhẹ - 2.hư hỏng không dùng được
  String? note;
  DateTime? shoppingDay;

  RoomFurniture(
      {required this.id,
      required this.name,
      required this.number,
      required this.price,
      required this.status,
      required this.note,
      required this.shoppingDay});

  RoomFurniture.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    number = json['number'] ?? 0;
    price = json['price'] ?? 0;
    price = json['status'] ?? 1;
    price = json['note'] ?? '';
    shoppingDay = json['shoppingDay'] != null
        ? Commons.formatDateTimeZone(json['shoppingDay'] as String)
        : null;
    ;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['number'] = number;
    map['price'] = price;
    map['status'] = status;
    map['note'] = note;
    map['shoppingDay'] = shoppingDay;
    return map;
  }
}
