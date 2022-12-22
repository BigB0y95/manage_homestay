import 'package:manager_homestay_app/models/room_furniture/room_furniture.dart';

class Room {
  int? id;
  String? name;
  int? type; // 0.thuê theo giờ - 1.thuê theo ngày - 2.thuê theo tháng - 3.thuê theo năm
  int? numberPerson; // số lượng người có thể ở
  double? price; // giá
  int? status; // 0.trống - 1.đã có người thuê - 2.đang sửa chữa - 3.không cho thuê nữa
  int? numberPersonNow; // số người đang ở hiện tại
  List<RoomFurniture>? roomFurniture; // danh sách vât dụng trong phòng

  Room({this.id, this.name, this.type, this.numberPerson, this.price, this.status, this.numberPersonNow, this.roomFurniture});

  Room.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    type = json['type'] ?? 0;
    numberPerson = json['numberPerson'] ?? 0;
    price = json['price'] ?? 0;
    status = json['status'] ?? 0;
    numberPersonNow = json['numberPersonNow'] ?? 0;
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
    map['numberPerson'] = numberPerson;
    map['price'] = price;
    map['status'] = status;
    map['numberPersonNow'] = numberPersonNow;
    if (roomFurniture != null) {
      map['roomFurniture'] = roomFurniture?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
