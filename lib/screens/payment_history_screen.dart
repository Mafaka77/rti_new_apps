import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/payment_history_controller.dart';
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
            body: const SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          );
        });
  }
}
