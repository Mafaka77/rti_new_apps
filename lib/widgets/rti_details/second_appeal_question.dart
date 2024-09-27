import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';

class SecondAppealQuestionWidget extends GetView<RtiController> {
  const SecondAppealQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      dense: true,
      title: Text(
        'Second Appeal Question',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
