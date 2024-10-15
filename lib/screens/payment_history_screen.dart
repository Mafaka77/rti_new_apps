import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/payment_history_controller.dart';
import 'package:rti_new_apps/widgets/payment_history/mobile_history_widget.dart';
import 'package:rti_new_apps/widgets/payment_history/web_history_widget.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentHistoryController>(
        init: PaymentHistoryController(),
        builder: (controller) {
          return Scaffold(
            appBar: myAppBarWidget(),
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              elevation: 0,
                              color: controller.isMobile.isTrue
                                  ? MyColor.green
                                  : Colors.white,
                              minWidth: Get.width * 0.4,
                              shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColor.green,
                                ),
                              ),
                              onPressed: () {
                                controller.isMobile.value = true;
                                controller.isWeb.value = false;
                              },
                              child: const Text('Mobile Payment'),
                            ),
                            MaterialButton(
                              elevation: 0,
                              color: controller.isWeb.isTrue
                                  ? MyColor.green
                                  : Colors.white,
                              minWidth: Get.width * 0.4,
                              shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColor.green,
                                ),
                              ),
                              onPressed: () {
                                controller.isWeb.value = true;
                                controller.isMobile.value = false;
                              },
                              child: const Text('Web Payment'),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => controller.isMobile.isTrue
                            ? const MobileHistoryWidget()
                            : const WebHistoryWidget(),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}
