import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:manager_homestay_app/constants/color.dart';
import 'package:manager_homestay_app/models/homestay/homestay.dart';
import 'package:manager_homestay_app/models/room/room.dart';
import 'package:manager_homestay_app/widgets/common/paginated_grid_widget.dart';

import 'homestay_widget.dart';

class HomestayList extends StatefulWidget {
  const HomestayList({Key? key}) : super(key: key);

  @override
  State<HomestayList> createState() => _HomestayListState();
}

class _HomestayListState extends State<HomestayList> {
  final PagingController<int, Homestay> _pagingController =
      PagingController(firstPageKey: 1);
  var homestayList = <Homestay>[].obs;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int page) async {
    homestayList.add(Homestay(
        id: 1,
        name: 'Vĩnh Tuy 1 Phố Hai Bà Trưng Hà Nội',
        address: 'Số 15, phố Vĩnh Tuy',
        operationStartDate: DateTime.now(),
        rooms: [
          Room(id: 1, name: 'phòng 101', type: 0, price: 120000, status: 0),
          Room(id: 2, name: 'phòng 102', type: 0, price: 120000, status: 1),
          Room(id: 3, name: 'phòng 103', type: 0, price: 120000, status: 2)
        ]));
    homestayList.add(Homestay(
        id: 2,
        name: 'Vĩnh Tuy 2',
        address: 'Số 15, phố Vĩnh Tuy',
        operationStartDate: DateTime.now()));
    homestayList.add(Homestay(
        id: 3,
        name: 'Vĩnh Tuy 3',
        address: 'Số 15, phố Vĩnh Tuy',
        operationStartDate: DateTime.now()));
    homestayList.add(Homestay(
        id: 4,
        name: 'Vinh Tuy 4',
        address: 'Số 15, phố Vĩnh Tuy',
        operationStartDate: DateTime.now()));
    _pagingController.appendLastPage(homestayList);
  }

  void onRefresh(int _) {
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        itemBuilder: (context, item, index) => HomestayWidget(homestay: item),
      ),
    );
    ;
  }
}
