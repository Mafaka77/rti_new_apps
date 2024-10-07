import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/complain_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class ComplainQuestionWidget extends GetView<ComplainController> {
  const ComplainQuestionWidget({super.key});

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
          'Question',
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
                    data.citizen_question.toString(),
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
                    'Attached File:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxWidth(10),
                  Text(data.citizen_question_file == null ? 'N/A' : ''),
                ],
              ),
              MaterialButton(
                elevation: 0,
                color: MyColor.green,
                onPressed: () {
                  downloadComplaintFile(
                      context, data.citizen_question_file, controller);
                },
                child: const Text(
                  'DOWNLOAD',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Wrap(
                children: [
                  const Text(
                    'Submitted On:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxWidth(10),
                  Text(DateFormat('dd-MMM-yyyy hh:mm a')
                      .format(DateTime.parse(data.created_at!))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
