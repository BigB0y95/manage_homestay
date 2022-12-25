import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_homestay_app/constants/color.dart';

import 'app_bar_widget.dart';

class TemplatePageWidget extends StatefulWidget {
  final String title;
  final bool isFilter;
  final bool isHome;
  final Widget body;
  final Widget? floatingActionButton;
  const TemplatePageWidget({Key? key, this.title = '', this.isFilter = true, this.isHome = false, required this.body, this.floatingActionButton})
      : super(key: key);

  @override
  State<TemplatePageWidget> createState() => _TemplatePageWidgetState();
}

class _TemplatePageWidgetState extends State<TemplatePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: widget.title,
          isFilter: widget.isFilter,
          isHome: widget.isHome,
        ),
        body: Container(
          height: double.infinity,
          color: AppColor.appBackground,
          padding: const EdgeInsets.all(10),
          child: widget.body,
        ),
        floatingActionButton: widget.floatingActionButton ?? Container());
  }
}
