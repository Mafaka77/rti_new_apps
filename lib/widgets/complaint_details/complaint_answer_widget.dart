import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/complain_controller.dart';

class ComplaintAnswerWidget extends GetView<ComplainController> {
  const ComplaintAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.complaintDetail.first;
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [],
      ),
    );
  }
}
