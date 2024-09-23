import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/home_controller.dart';

class HomeTabWidget extends GetView<HomeController> {
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
              color: controller.isRtiSelected.isTrue
                  ? MyColor.green
                  : Colors.white,
              minWidth: Get.width * 0.4,
              onPressed: () {
                controller.isRtiSelected.value = true;
                controller.isComplainSelected.value = false;
              },
              child: const Text('RTI'),
            ),
            MaterialButton(
              elevation: 0,
              color: controller.isComplainSelected.isTrue
                  ? MyColor.green
                  : Colors.white,
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
