import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool isHome;
  final bool isFilter;

  const AppBarWidget({Key? key, required this.title, this.isHome = false, this.isFilter = true}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      leadingWidth: !widget.isHome ? 30 : 0,
      leading: !widget.isHome
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox(),
      actions: [
        widget.isFilter
            ? IconButton(
                icon: const Icon(Icons.filter_list),
                tooltip: 'Lọc dữ liệu',
                onPressed: () {},
              )
            : Container(),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.userTie),
          tooltip: 'Thông tin người dùng',
          onPressed: () {},
        ),
      ],
    );
  }
}
