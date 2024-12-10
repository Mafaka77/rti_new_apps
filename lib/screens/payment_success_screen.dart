import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/home_controller.dart';
import 'package:rti_new_apps/controllers/payment_success_controller.dart';
import 'package:rti_new_apps/services/department_wise_services.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class PaymentSuccessScreen extends GetView<HomeController> {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var receipt = Get.parameters['receipt'];
    var paymentId = Get.parameters['paymentId'];
    var signature = Get.parameters['signature'];
    var orderId = Get.parameters['orderId'];
    controller.verifyPayment(receipt!, signature!, orderId!, paymentId!);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Obx(
            () => controller.isPaymentVerifyLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.isPaymentSuccess.isFalse
                    ? Column(
                        children: [
                          sizedBoxHeight(Get.height * 0.15),
                          Image(
                            height: Get.height * 0.1,
                            image: const AssetImage('images/close.png'),
                          ),
                          sizedBoxHeight(20),
                          const Text(
                            'FAILED',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          sizedBoxHeight(10),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: MaterialButton(
                              elevation: 0,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              minWidth: Get.width,
                              color: MyColor.green,
                              onPressed: () {
                                Get.offAllNamed('/');
                              },
                              child: const Text(
                                'BACK',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          sizedBoxHeight(Get.height * 0.15),
                          Image(
                            height: Get.height * 0.1,
                            image: const AssetImage('images/check.png'),
                          ),
                          sizedBoxHeight(20),
                          const Text(
                            'SUCCESS',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          sizedBoxHeight(20),
                          ClipPath(
                            clipper: ZigZagClipper(),
                            child: Container(
                                width: Get.width * 0.8,
                                color: MyColor.lightGreen,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 40,
                                      bottom: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Center(
                                        child: Text(
                                          'RECEIPT',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          controller.receipt_id.value,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Text('Order ID'),
                                      AutoSizeText(
                                        controller.order_id.value,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text('Payment ID'),
                                      AutoSizeText(
                                        controller.payment_id.value,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text('Transaction Date'),
                                      AutoSizeText(
                                        DateFormat('dd-MMM-yyyy hh:mm a')
                                            .format(DateTime.parse(controller
                                                .transactionDate.value)),
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          sizedBoxHeight(10),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: MaterialButton(
                              elevation: 0,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              minWidth: Get.width,
                              color: MyColor.green,
                              onPressed: () {
                                Get.offAllNamed('/');
                              },
                              child: const Text(
                                'Home',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      )),
    );
  }
}

class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double zigzagHeight = 20.0;
    int zigzagCount = (size.width / (zigzagHeight * 2)).floor();

    final path = Path();
    path.moveTo(0, 0); // Starting point

    for (int i = 0; i < zigzagCount; i++) {
      path.lineTo((i * 2 + 1) * zigzagHeight, zigzagHeight);
      path.lineTo((i * 2 + 2) * zigzagHeight, 0);
    }

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
