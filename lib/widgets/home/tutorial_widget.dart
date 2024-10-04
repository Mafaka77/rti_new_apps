import 'package:flutter/material.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class TutorialWidget extends StatelessWidget {
  const TutorialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 5,
                height: 10,
                color: MyColor.green,
              ),
              sizedBoxWidth(5),
              const Text('Tutorials(RTI Online hman dan tlangpui te)'),
            ],
          ),
        ],
      ),
    );
  }
}
