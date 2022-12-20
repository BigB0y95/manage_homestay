import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_homestay_app/widgets/common/app_bar_widget.dart';

class RoomListWidget extends StatefulWidget {
  const RoomListWidget({Key? key}) : super(key: key);

  @override
  State<RoomListWidget> createState() => _RoomListWidgetState();
}

class _RoomListWidgetState extends State<RoomListWidget> {
  void _addRoom() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Manage Room'),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRoom,
        tooltip: 'add homestay',
        child: const Icon(Icons.add),
      ),
    );
  }
}
