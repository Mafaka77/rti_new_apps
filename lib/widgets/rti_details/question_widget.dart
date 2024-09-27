import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class RtiDetailsQuestionWidget extends GetView<RtiController> {
  const RtiDetailsQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return ExpansionTile(
      backgroundColor: Colors.white,
      controller: controller.questionTileController,
      dense: true,
      maintainState: true,
      initiallyExpanded: true,
      shape: const RoundedRectangleBorder(),
      onExpansionChanged: (value) {
        controller.spioAnswerTileController.collapse();
        controller.firstAppealTileController.collapse();
      },
      title: const Text(
        'Question',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    data.citizen_question.toString(),
                    maxLines: 100,
                  )
                ],
              ),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  const Text(
                    'Attached File:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxWidth(10),
                  Text(data.citizen_question_file == null ? 'N/A' : ''),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Wrap(
                children: [
                  const Text(
                    'Concern Department:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxWidth(10),
                  Text(data.department!.name),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Wrap(
                children: [
                  const Text(
                    'BPL:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedBoxWidth(10),
                  Text(data.citizen_bpl == 1 ? 'Yes' : 'No'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Wrap(
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
            ),
          ],
        ),
      ],
    );
  }
}
