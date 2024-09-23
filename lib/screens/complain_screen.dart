import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/complain_controller.dart';

class ComplainScreen extends StatelessWidget {
  const ComplainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComplainController>(
        init: ComplainController(),
        builder: (controller) {
          return Container();
        });
  }
}
