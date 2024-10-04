import 'package:flutter/material.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 20,
                color: MyColor.green,
              ),
              sizedBoxWidth(5),
              const Text('Online RTI Count'),
            ],
          ),
        ],
      ),
    );
  }
}
