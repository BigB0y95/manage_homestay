import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:manager_homestay_app/constants/color.dart';
import 'package:manager_homestay_app/models/homestay.dart';
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
        name: 'Vinh Tuy 1 Vinh Tuy 1 Vinh Tuy 1 Vinh Tuy 1',
        address: 'Số 15, phố Vĩnh Tuy',
        operationStartDate: DateTime.now()));
    homestayList.add(Homestay(
        id: 2,
        name: 'Vinh Tuy 2',
        address: 'Số 15, phố Vĩnh Tuy',
        operationStartDate: DateTime.now()));
    homestayList.add(Homestay(
        id: 3,
        name: 'Vinh Tuy 3',
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
