import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class FreeAttachmentWidget extends GetView<RtiController> {
  const FreeAttachmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          const Text(
            ' Answer File:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          sizedBoxWidth(10),
          data.spio_answer_file == null
              ? const Text('N/A')
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.download,
                  ),
                ),
        ],
      ),
    );
  }
}
