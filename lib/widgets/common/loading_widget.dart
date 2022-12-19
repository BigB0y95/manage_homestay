import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatelessWidget {
  final double paddingTop;
  final Color? color;

  const LoadingWidget({Key? key, this.paddingTop = 0, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: paddingTop),
        child: CupertinoActivityIndicator(color: color),
      ),
    );
  }
}
