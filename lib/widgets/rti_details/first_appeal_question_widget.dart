import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';

class FirstQuestionAppealWidget extends GetView<RtiController> {
  const FirstQuestionAppealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controller: controller.firstAppealTileController,
      title: const Text('First Appeal Question'),
      dense: true,
      maintainState: true,
      children: const [
        Text('data'),
      ],
    );
  }
}
