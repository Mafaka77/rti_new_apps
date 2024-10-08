import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/complain_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class ComplaintAnswerWidget extends GetView<ComplainController> {
  const ComplaintAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.complaintDetail.first;
    return Container(
      padding: const EdgeInsets.all(20),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        // controller: controller.questionTileController,
        dense: true,
        maintainState: true,
        initiallyExpanded: true,
        shape: const RoundedRectangleBorder(),
        childrenPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        collapsedBackgroundColor: Colors.white,
        onExpansionChanged: (value) {
          // controller.spioAnswerTileController.collapse();
          // controller.firstAppealTileController.collapse();
        },
        title: const Text(
          'Answer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    data.second_appeal_cic_answer.toString(),
                    maxLines: 100,
                  )
                ],
              ),
              const Divider(
                indent: 40,
                endIndent: 40,
              ),
              Row(
                children: [
                  const Text(
                    'Answered File:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxWidth(10),
                  Text(data.second_appeal_cic_answer_file == null ? 'N/A' : ''),
                ],
              ),
              data.second_appeal_cic_answer_file == null
                  ? Container()
                  : MaterialButton(
                      elevation: 0,
                      color: MyColor.green,
                      onPressed: () {
                        downloadComplaintFile(context,
                            data.second_appeal_cic_answer_file, controller);
                      },
                      child: const Text(
                        'DOWNLOAD',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
              Wrap(
                children: [
                  const Text(
                    'Answered On:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxWidth(10),
                  Text(DateFormat('dd-MMM-yyyy hh:mm a')
                      .format(DateTime.parse(data.second_appeal_cic_out!))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
