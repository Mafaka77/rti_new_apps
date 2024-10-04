import 'package:flutter/material.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class FaqWidget extends StatelessWidget {
  const FaqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 10,
                width: 5,
                color: MyColor.green,
              ),
              sizedBoxWidth(3),
              const Text('FAQ')
            ],
          )
        ],
      ),
    );
  }
}
