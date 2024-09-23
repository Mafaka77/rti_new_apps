import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/screens/department_rti_screen.dart';
import 'package:rti_new_apps/screens/local_council_rti_screen.dart';
import 'package:rti_new_apps/widgets/rti/rti_button_widget.dart';

class SubmitRtiScreen extends GetView<RtiController> {
  const SubmitRtiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RtiButtonWidget(),
            Obx(() => controller.isDepartment.isTrue
                ? const DepartmentRtiScreen()
                : Container()),
            Obx(() => controller.isLocalCouncil.isTrue
                ? const LocalCouncilRtiScreen()
                : Container())
          ],
        ),
      ),
    );
  }
}
