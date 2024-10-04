import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/home_controller.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';

class RtiButtonWidget extends GetView<HomeController> {
  const RtiButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => MaterialButton(
                elevation: 0,
                color: controller.isDepartment.isTrue
                    ? MyColor.green
                    : Colors.white,
                minWidth: Get.width * 0.4,
                child: const Text('Department'),
                onPressed: () {
                  controller.isDepartment.value = true;
                  controller.isLocalCouncil.value = false;
                },
              )),
          Obx(() => MaterialButton(
                elevation: 0,
                color: controller.isLocalCouncil.isTrue
                    ? MyColor.green
                    : Colors.white,
                minWidth: Get.width * 0.4,
                child: const Text('Local Council'),
                onPressed: () {
                  controller.isLocalCouncil.value = true;
                  controller.isDepartment.value = false;
                },
              )),
        ],
      ),
    );
  }
}
