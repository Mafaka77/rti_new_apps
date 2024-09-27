import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class PaidAttachmentWidget extends GetView<RtiController> {
  const PaidAttachmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                ' Answer File:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              sizedBoxWidth(10),
              data.paid_attachments!.attachment_name == null
                  ? const Text('N/A')
                  : Text(
                      data.paid_attachments!.attachment_name.toString(),
                    ),
            ],
          ),
          data.paid_attachments!.payment_status == 'Unpaid'
              ? MaterialButton(
                  elevation: 0,
                  color: MyColor.green,
                  onPressed: () {},
                  child: const Text(
                    'PAY',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : MaterialButton(
                  elevation: 0,
                  color: MyColor.green,
                  onPressed: () {},
                  child: const Text(
                    'DOWNLOAD',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
        ],
      ),
    );
  }
}
