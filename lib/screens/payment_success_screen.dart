import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/payment_success_controller.dart';
import 'package:rti_new_apps/services/department_wise_services.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var receipt = Get.parameters['receipt'];
    var paymentId = Get.parameters['paymentId'];
    var signature = Get.parameters['signature'];
    var orderId = Get.parameters['orderId'];
    print(Get.parameters['orderId']);
    return GetBuilder<PaymentSuccessController>(
        initState: (state) async {
          state.controller!.verifyPayment();
        },
        init: PaymentSuccessController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    sizedBoxHeight(Get.height * 0.15),
                    Image(
                      height: Get.height * 0.2,
                      image: const AssetImage('images/shield.gif'),
                    ),
                    sizedBoxHeight(20),
                    const Text('RTI PAYMENT SUCCESSFUL')
                  ],
                ),
              ),
            )),
          );
        });
  }
}
