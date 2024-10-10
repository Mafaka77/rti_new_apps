import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rti_new_apps/colors.dart';
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
      childrenPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
            data.department != null
                ? Wrap(
                    children: [
                      const Text(
                        'Concern Department:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      sizedBoxWidth(10),
                      Text(data.department!.name),
                    ],
                  )
                : Wrap(
                    children: [
                      const Text(
                        'Local Council:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      sizedBoxWidth(10),
                      Text(data.local_council!.name.toString()),
                    ],
                  ),
            Wrap(
              children: [
                const Text(
                  'BPL:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                sizedBoxWidth(10),
                Text(data.citizen_bpl == 1 ? 'Yes' : 'No'),
              ],
            ),
            Wrap(
              children: [
                const Text(
                  'BPL File:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                sizedBoxWidth(10),
                data.citizen_bpl_file != null
                    ? Text(data.citizen_bpl_file!)
                    : const Text('N/A'),
              ],
            ),
            data.citizen_bpl_file != null
                ? MaterialButton(
                    elevation: 0,
                    color: MyColor.green,
                    onPressed: () {
                      downloadFile(context, data.citizen_bpl_file, controller);
                    },
                    child: const Text(
                      'DOWNLOAD',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Container(),
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
    );
  }
}
