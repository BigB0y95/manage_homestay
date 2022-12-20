import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_homestay_app/widgets/common/app_bar_widget.dart';

import 'homestay_page/homestay_list_widget.dart';

class MyHomePageWidget extends StatefulWidget {
  const MyHomePageWidget({Key? key}) : super(key: key);

  @override
  State<MyHomePageWidget> createState() => _MyHomePageWidgetState();
}

class _MyHomePageWidgetState extends State<MyHomePageWidget> {
  int _selectedIndex = 0;
  static const TextStyle textBoldSize30 =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 5);
  static const List<Widget> _widgetOptions = <Widget>[
    HomestayList(),
    Text(
      'Index 1: Business',
      style: textBoldSize30,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addHomestay() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Manage Homestay'),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addHomestay,
        tooltip: 'add homestay',
        child: const Icon(Icons.add_home),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Data',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
