import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager_homestay_app/constants/color.dart';
import 'package:manager_homestay_app/models/room/room.dart';

class RoomWidget extends StatefulWidget {
  final Room room;
  const RoomWidget({Key? key, required this.room}) : super(key: key);

  @override
  State<RoomWidget> createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State<RoomWidget> {
  @override
  Widget build(BuildContext context) {
    Color status = AppColor.emptyStatus;
    IconData icon = FontAwesomeIcons.doorOpen;
    if (widget.room.status == 1) {
      status = AppColor.inhabitedStatus;
    } else if (widget.room.status == 2) {
      status = AppColor.correctingStatus;
    } else if (widget.room.status == 3) {
      status = AppColor.notUseStatus;
    }
    if (widget.room.status != 0) {
      icon = FontAwesomeIcons.doorClosed;
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          // Get.to(() => RoomListWidget(), transition: Transition.rightToLeft);
        },
        child: Column(
          children: [
            FaIcon(
              icon,
              size: 60,
              color: status,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                width: double.infinity,
                child: Text(
                  widget.room.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
            widget.room.status == 0 || widget.room.status == 1
                ? SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.group,
                          size: 18,
                          color: AppColor.pastDueColor,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            '${widget.room.numberPersonNow} / ${widget.room.numberPerson}',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
