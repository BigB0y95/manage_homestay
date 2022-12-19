import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_homestay_app/models/homestay.dart';

class HomestayWidget extends StatefulWidget {
  final Homestay homestay;
  const HomestayWidget({Key? key, required this.homestay}) : super(key: key);

  @override
  State<HomestayWidget> createState() => _HomestayWidgetState();
}

class _HomestayWidgetState extends State<HomestayWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: InkWell(
        onTap: () {
          // Get.to(() => MyPageWidget(), transition: Transition.rightToLeft);
        },
        child: Column(
          children: [
            const Icon(
              Icons.home,
              size: 60,
            ),
            Text(
              widget.homestay.name ?? '',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 3,
            )
          ],
        ),
      ),
    );
  }
}
