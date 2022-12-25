import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:manager_homestay_app/widgets/common/no_data_widget.dart';

import 'custom_refresh_indicator.dart';
import 'loading_widget.dart';

class PaginatedGridWidget extends StatelessWidget {
  final PagingController<int, dynamic> pagingController;
  final Function itemBuilder;
  final Function refresh;
  final int refreshPage;
  final Widget? divider;
  final Color? bgColor;
  final bool isHorizontal;
  final ScrollPhysics? physics;
  final int gridCount;
  final double mainSpacing;
  final double crossSpacing;
  final double childRatio;
  final bool isLoading;
  final bool shrinkWrap;
  final bool isSliver;
  final double refreshDisplacement;
  final ScrollController? scrollController;
  final Widget? widgetAboveList;

  const PaginatedGridWidget(
      {Key? key,
      required this.pagingController,
      required this.itemBuilder,
      required this.refresh,
      this.refreshPage = 1,
      this.divider,
      this.bgColor,
      this.isHorizontal = false,
      this.physics,
      this.gridCount = 2,
      this.mainSpacing = 10,
      this.crossSpacing = 10,
      this.childRatio = 1,
      this.isLoading = true,
      this.shrinkWrap = true,
      this.isSliver = false,
      this.refreshDisplacement = 40,
      this.scrollController,
      this.widgetAboveList})
      : super(key: key);

  _buildSliverGrid() {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: crossSpacing,
      childAspectRatio: childRatio,
      mainAxisSpacing: mainSpacing,
      crossAxisCount: gridCount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      width: double.infinity,
      child: CustomRefreshIndicator(
        displacement: refreshDisplacement,
        onRefresh: () => Future.sync(() => {refresh(refreshPage)}),
        child: isSliver ? _buildSliverGridView() : _buildNormalGridView(),
      ),
    );
  }

  Widget _buildNormalGridView() {
    return PagedGridView<int, dynamic>(
      padding: EdgeInsets.zero,
      pagingController: pagingController,
      scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
      shrinkWrap: shrinkWrap,
      physics: physics,
      clipBehavior: Clip.none,
      gridDelegate: _buildSliverGrid(),
      builderDelegate: PagedChildBuilderDelegate<dynamic>(
        firstPageProgressIndicatorBuilder: isLoading == true ? (context) => const LoadingWidget() : null,
        newPageProgressIndicatorBuilder: (context) => const LoadingWidget(),
        noItemsFoundIndicatorBuilder: (context) => const NoData(),
        itemBuilder: (context, item, index) => itemBuilder(context, item, index),
      ),
    );
  }

  Widget _buildSliverGridView() {
    return CustomScrollView(
      clipBehavior: Clip.none,
      shrinkWrap: shrinkWrap,
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
      slivers: [
        SliverToBoxAdapter(child: widgetAboveList ?? const SizedBox()),
        PagedSliverGrid(
          pagingController: pagingController,
          addAutomaticKeepAlives: false,
          gridDelegate: _buildSliverGrid(),
          builderDelegate: PagedChildBuilderDelegate<dynamic>(
            firstPageProgressIndicatorBuilder: isLoading == true ? (context) => const LoadingWidget() : null,
            newPageProgressIndicatorBuilder: (context) => const LoadingWidget(),
            noItemsFoundIndicatorBuilder: (context) => const NoData(),
            itemBuilder: (context, item, index) => itemBuilder(context, item, index),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(),
        ),
      ],
    );
  }
}
