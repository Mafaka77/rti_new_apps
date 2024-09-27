import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';

class FirstQuestionAppealWidget extends GetView<RtiController> {
  const FirstQuestionAppealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return ExpansionTile(
      backgroundColor: Colors.white,
      controller: controller.firstAppealTileController,
      title: const Text(
        'First Appeal Question',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: const RoundedRectangleBorder(),
      dense: true,
      onExpansionChanged: (value) {
        if (value == true) {
          controller.spioAnswerTileController.collapse();
          controller.questionTileController.collapse();
        }
      },
      maintainState: true,
      children: [
        AutoSizeText(
          data.first_appeal_citizen_question.toString(),
          maxLines: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            children: [
              const Text(
                'Attachment:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              data.first_appeal_citizen_question_file == null
                  ? const Text(' N/A')
                  : MaterialButton(
                      elevation: 0,
                      color: MyColor.green,
                      onPressed: () {},
                      child: const Text('DOWNLOAD'),
                    ),
            ],
          ),
        )
      ],
    );
  }
}
