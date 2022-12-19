import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_homestay_app/constants/color.dart';

class NoData extends StatelessWidget {
  final bool isHorizontal;
  final EdgeInsets margin;
  final bool isFavorite;
  final bool isHistory;

  const NoData(
      {Key? key,
      this.margin = const EdgeInsets.only(top: 100.0, bottom: 100),
      this.isHorizontal = false,
      this.isFavorite = false,
      this.isHistory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 210,
      color: AppColor.appBackground,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(
          Icons.sentiment_very_dissatisfied,
          color: AppColor.subTextColor,
          size: 90,
        ),
        // SvgPicture.asset('assets/icons/sad_face_icon.svg'),
        Container(
          margin:
              isHorizontal ? EdgeInsets.zero : const EdgeInsets.only(top: 15.0),
          child: const Text(
            'No data!',
            style: TextStyle(
              fontSize: 18,
              height: 16 / 13,
              fontWeight: FontWeight.bold,
              color: AppColor.subTextColor,
            ),
          ),
        ),
      ]),
    );
  }
}
