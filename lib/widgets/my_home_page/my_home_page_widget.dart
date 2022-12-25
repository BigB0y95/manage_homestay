import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manager_homestay_app/constants/color.dart';
import 'package:manager_homestay_app/widgets/common/app_bar_widget.dart';

import 'homestay_page/add_homestay_widget.dart';
import 'homestay_page/homestay_list_widget.dart';

class MyHomePageWidget extends StatefulWidget {
  const MyHomePageWidget({Key? key}) : super(key: key);

  @override
  State<MyHomePageWidget> createState() => _MyHomePageWidgetState();
}

class _MyHomePageWidgetState extends State<MyHomePageWidget> {
  int _selectedIndex = 0;
  static const TextStyle textBoldSize30 = TextStyle(fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 5);
  static const List<Widget> _widgetOptions = <Widget>[
    HomestayList(),
    Text('Dữ liệu', style: textBoldSize30),
    Text('Hướng dẫn', style: textBoldSize30),
    Text('Thông tin ứng dụng', style: textBoldSize30),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addHomestay() {
    Get.to(() => const AddHomestayWidget(), transition: Transition.rightToLeft);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'My Homestay',
        isHome: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addHomestay,
        tooltip: 'add homestay',
        backgroundColor: AppColor.pastDueColor,
        child: const Icon(Icons.add_home),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Dữ liệu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Hướng dẫn',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.widgets),
          //   label: 'Thông tin',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.pastDueColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
