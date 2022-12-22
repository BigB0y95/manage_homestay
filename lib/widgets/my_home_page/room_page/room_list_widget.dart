import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:manager_homestay_app/constants/color.dart';
import 'package:manager_homestay_app/models/room/room.dart';
import 'package:manager_homestay_app/widgets/common/app_bar_widget.dart';
import 'package:manager_homestay_app/widgets/common/paginated_grid_widget.dart';
import 'package:manager_homestay_app/widgets/my_home_page/room_page/room_widget.dart';

class RoomListWidget extends StatefulWidget {
  const RoomListWidget({Key? key}) : super(key: key);

  @override
  State<RoomListWidget> createState() => _RoomListWidgetState();
}

class _RoomListWidgetState extends State<RoomListWidget> {
  final PagingController<int, Room> _pagingController = PagingController(firstPageKey: 1);
  var roomList = <Room>[].obs;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int page) async {
    roomList.add(Room(id: 1, name: 'phòng 101', type: 0, numberPerson: 2, price: 120000, status: 0, numberPersonNow: 0));
    roomList.add(Room(id: 2, name: 'phòng 102', type: 0, numberPerson: 2, price: 120000, status: 1, numberPersonNow: 2));
    roomList.add(Room(id: 3, name: 'phòng 103', type: 0, numberPerson: 2, price: 120000, status: 2, numberPersonNow: 0));
    roomList.add(Room(id: 4, name: 'phòng 104', type: 0, numberPerson: 2, price: 120000, status: 3, numberPersonNow: 0));
    roomList.add(Room(id: 5, name: 'phòng 105', type: 0, numberPerson: 2, price: 120000, status: 0, numberPersonNow: 0));
    _pagingController.appendLastPage(roomList);
  }

  void _addRoom() {
    setState(() {});
  }

  void onRefresh(int _) {
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (isDialOpen.value) {
            isDialOpen.value = false;
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: const AppBarWidget(title: 'Quản lý phòng'),
          body: Container(
            height: double.infinity,
            color: AppColor.appBackground,
            padding: const EdgeInsets.all(10),
            child: PaginatedGridWidget(
              gridCount: 3,
              scrollController: ScrollController(),
              pagingController: _pagingController,
              refresh: onRefresh,
              refreshPage: 1,
              childRatio: 1 / 1.27,
              itemBuilder: (context, item, index) => RoomWidget(room: item),
            ),
          ),
          floatingActionButton: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            openCloseDial: isDialOpen,
            spacing: 3,
            childPadding: const EdgeInsets.all(5),
            spaceBetweenChildren: 4,
            backgroundColor: AppColor.pastDueColor,
            children: [
              SpeedDialChild(
                  child: const Icon(Icons.exposure_plus_1, color: Colors.white),
                  label: 'thêm một phòng',
                  backgroundColor: AppColor.planningColor,
                  onTap: () {}),
              SpeedDialChild(
                child: const Icon(Icons.add_to_photos, color: Colors.white),
                label: 'thêm nhiều phòng',
                backgroundColor: AppColor.planningColor,
                onTap: () {},
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: _addRoom,
          //   tooltip: 'add room',
          //   child: const Icon(Icons.add),
          // ),
        ));
  }
}
