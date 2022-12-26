import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_homestay_app/constants/color.dart';
import 'package:manager_homestay_app/constants/dropdown.dart';
import 'package:manager_homestay_app/utils/device/device_utils.dart';
import 'package:manager_homestay_app/widgets/common/dropdown_field_widget.dart';
import 'package:manager_homestay_app/widgets/common/input_text_field_widget.dart';
import 'package:manager_homestay_app/widgets/common/template_page_widget.dart';

class AddHomestayWidget extends StatefulWidget {
  const AddHomestayWidget({Key? key}) : super(key: key);

  @override
  State<AddHomestayWidget> createState() => _AddHomestayWidgetState();
}

class _AddHomestayWidgetState extends State<AddHomestayWidget> {
  final _homestayName = ''.obs;
  final _homestayAddress = ''.obs;
  final _homestayStatusIndex = 0.obs;
  final _homestayStatusValue = 0.obs;
  final _homestayTypeIndex = 0.obs;
  final _homestayTypeValue = 0.obs;

  var messageHomestayName = <String>[].obs;
  var messageHomestayAddress = <String>[].obs;
  @override
  Widget build(BuildContext context) {
    return TemplatePageWidget(title: 'Thêm Homestay', isFilter: false, body: body());
  }

  Widget body() {
    return GestureDetector(
      onTap: () {
        DeviceUtils.hideKeyboard(context);
      },
      child: ListView(
        children: [
          InputTextFieldWidget(
            label: 'Tên homestay',
            isRequired: true,
            hint: 'Tối đa 255 ký tự',
            onChanged: (String value) => setState(() => _homestayName.value = value),
          ),
          InputTextFieldWidget(
            label: 'Địa chỉ homestay',
            isRequired: true,
            hint: 'Tối đa 255 ký tự',
            onChanged: (String value) => setState(() => _homestayAddress.value = value),
          ),
          Obx(
            () => DropdownFieldWidget(
              label: 'Trạng thái',
              isRequired: true,
              dialogHeight: 200,
              listItems: Dropdown.homestayStatus,
              onChanged: (int value) => setState(() => {
                    _homestayStatusValue.value = value,
                    _homestayStatusIndex.value = Dropdown.homestayStatus.values.elementAt(value),
                  }),
              selectedIndex: _homestayStatusIndex.value,
            ),
          ),
          Obx(
            () => DropdownFieldWidget(
              label: 'Loại hình kinh doanh',
              isRequired: true,
              dialogHeight: 200,
              listItems: Dropdown.homestayType,
              onChanged: (int value) => setState(() => {
                    _homestayTypeValue.value = value,
                    _homestayTypeIndex.value = Dropdown.homestayType.values.elementAt(value),
                  }),
              selectedIndex: _homestayTypeIndex.value,
            ),
          ),
        ],
      ),
    );
  }
}
