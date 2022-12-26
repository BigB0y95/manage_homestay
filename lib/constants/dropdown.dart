class Dropdown {
  // trạng thái homestay
  static const Map<String, int> homestayStatus = {
    'Hoạt động': 0,
    'Đang sửa chữa': 1,
    'Không hoạt động': 2,
  };

  // Loại hình hoạt động
  static const Map<String, int> homestayType = {
    'Thuê theo giờ (Nhà nghỉ)': 0,
    'Thuê theo ngày (Homestay)': 1,
    'Thuê theo tháng (Nhà trọ)': 2,
  };

  // static const List<String> homestayType = [
  //   'Chọn loại hình kinh doanh',
  //   'Thuê theo giờ (Nhà nghỉ)',
  //   'Thuê theo ngày (Homestay)',
  //   'Thuê theo tháng (Nhà trọ)',
  // ];
}
