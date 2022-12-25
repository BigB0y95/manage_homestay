import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:manager_homestay_app/constants/color.dart';
import 'package:manager_homestay_app/models/homestay/homestay.dart';
import 'package:manager_homestay_app/widgets/my_home_page/room_page/room_list_widget.dart';

class HomestayWidget extends StatefulWidget {
  final Homestay homestay;
  const HomestayWidget({Key? key, required this.homestay}) : super(key: key);

  @override
  State<HomestayWidget> createState() => _HomestayWidgetState();
}

class _HomestayWidgetState extends State<HomestayWidget> {
  @override
  Widget build(BuildContext context) {
    Color status = AppColor.activeHomestayStatus;
    IconData icon = FontAwesomeIcons.houseCircleCheck;
    if (widget.homestay.status == 1) {
      status = AppColor.correctingHomestayStatus;
      icon = FontAwesomeIcons.houseCircleExclamation;
    } else if (widget.homestay.status == 2) {
      status = AppColor.notUseHomestayStatus;
      icon = FontAwesomeIcons.houseCircleXmark;
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Get.to(() => RoomListWidget(homestay: widget.homestay), transition: Transition.rightToLeft);
        },
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 70,
              width: double.infinity,
              child: FaIcon(
                icon,
                size: 70,
                color: status,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 15, bottom: 10),
                width: double.infinity,
                child: Text(
                  widget.homestay.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     margin: const EdgeInsets.only(bottom: 10),
            //     width: double.infinity,
            //     child: Text(
            //       widget.homestay.address ?? '',
            //       overflow: TextOverflow.ellipsis,
            //       // textAlign: TextAlign.center,
            //       maxLines: 2,
            //       style: const TextStyle(fontSize: 13),
            //     ),
            //   ),
            // ),
            widget.homestay.status == 0
                ? SizedBox(
                    height: 20,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.doorOpen,
                              size: 18,
                              color: AppColor.emptyStatus,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              alignment: Alignment.bottomLeft,
                              child: const Text(
                                '2 / 5',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: const FaIcon(
                            FontAwesomeIcons.penToSquare,
                            size: 18,
                            color: AppColor.pastDueColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        size: 18,
                        color: AppColor.pastDueColor,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
