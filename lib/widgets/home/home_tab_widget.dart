import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/home_controller.dart';
import 'package:rti_new_apps/controllers/track_controller.dart';

class HomeTabWidget extends GetView<TrackController> {
  const HomeTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              elevation: 0,
              color: controller.isRtiSelected.isFalse ? null : Colors.white,
              shape: BeveledRectangleBorder(
                  side: BorderSide(
                color: controller.isRtiSelected.isTrue
                    ? MyColor.green
                    : Colors.white,
              )),
              minWidth: Get.width * 0.4,
              onPressed: () {
                controller.isRtiSelected.value = true;
                controller.isComplainSelected.value = false;
              },
              child: const Text('RTI'),
            ),
            MaterialButton(
              elevation: 0,
              color:
                  controller.isComplainSelected.isFalse ? null : Colors.white,
              shape: BeveledRectangleBorder(
                  side: BorderSide(
                color: controller.isComplainSelected.isTrue
                    ? MyColor.green
                    : Colors.white,
              )),
              minWidth: Get.width * 0.4,
              onPressed: () {
                controller.isComplainSelected.value = true;
                controller.isRtiSelected.value = false;
              },
              child: const Text('COMPLAINT'),
            ),
          ],
        ),
      ),
    );
  }
}
