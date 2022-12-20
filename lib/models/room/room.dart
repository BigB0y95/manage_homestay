import 'package:manager_homestay_app/models/room_furniture/room_furniture.dart';
import 'package:manager_homestay_app/utils/commons.dart';

class Room {
  int? id;
  String? name;
  // 0.thuê theo giờ - 1.thuê theo ngày - 2.thuê theo tháng - 3.thuê theo năm
  int? type;
  double? price;
  // 0.trống - 1.đã có người thuê - 2.có người đặt trước - 3.đang sửa chữa - 4.không cho thuê nữa
  int? status;
  List<RoomFurniture>? roomFurniture;

  Room(
      {this.id,
      this.name,
      this.type,
      this.price,
      this.status,
      this.roomFurniture});

  Room.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    type = json['type'] ?? 0;
    price = json['price'] ?? 0;
    status = json['status'] ?? 0;
    roomFurniture = [];
    if (json['roomFurniture'] != null) {
      json['roomFurniture']?.forEach((v) {
        if (v != null) {
          roomFurniture?.add(RoomFurniture.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['price'] = price;
    map['status'] = status;
    if (roomFurniture != null) {
      map['roomFurniture'] = roomFurniture?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
