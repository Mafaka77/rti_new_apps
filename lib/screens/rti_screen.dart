import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';

class RtiScreen extends StatelessWidget {
  const RtiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RtiController>(
        init: RtiController(),
        builder: (context) {
          return Container(
            child: const Column(
              children: [
                Text('asd'),
              ],
            ),
          );
        });
  }
}
