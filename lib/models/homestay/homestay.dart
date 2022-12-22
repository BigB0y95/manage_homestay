import 'package:manager_homestay_app/models/room/room.dart';
import 'package:manager_homestay_app/utils/commons.dart';

class Homestay {
  int? id;
  String? name;
  int? status; // 0. đang hoạt động - 1. đang sửa chữa - 2. không còn hoạt động
  String? address;
  DateTime? operationStartDate; // ngày bắt đầu đi vào hoạt động
  List<Room>? rooms;

  Homestay({this.id, this.name, this.status, this.address, this.operationStartDate, this.rooms});

  Homestay.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    status = json['status'] ?? 0;
    address = json['address'] ?? '';
    operationStartDate = json['operationStartDate'] != null ? Commons.formatDateTimeZone(json['operationStartDate'] as String) : null;
    rooms = [];
    if (json['rooms'] != null) {
      json['rooms'].forEach((v) {
        if (v != null) {
          rooms?.add(Room.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['status'] = status;
    map['address'] = address;
    map['operationStartDate'] = operationStartDate;
    if (rooms != null) {
      map['rooms'] = rooms?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
