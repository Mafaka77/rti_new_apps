import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/services/routes.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class FirstQuestionAppealWidget extends GetView<RtiController> {
  const FirstQuestionAppealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return ExpansionTile(
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      controller: controller.firstAppealTileController,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      expandedAlignment: Alignment.topLeft,
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
          // controller.spioAnswerTileController.collapse();
          // controller.questionTileController.collapse();
        }
      },
      maintainState: true,
      children: [
        AutoSizeText(
          data.first_appeal_citizen_question.toString(),
          maxLines: 20,
        ),
        const Divider(
          indent: 40,
          endIndent: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                const Text(
                  'Attachment:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                data.first_appeal_citizen_question_file != null
                    ? Text(data.first_appeal_citizen_question_file.toString())
                    : const Text('N/A'),
              ],
            ),
            data.first_appeal_citizen_question_file == null
                ? Container()
                : MaterialButton(
                    elevation: 0,
                    color: MyColor.green,
                    onPressed: () {
                      downloadFile(context,
                          data.first_appeal_citizen_question_file, controller);
                    },
                    child: const Text('DOWNLOAD'),
                  ),
          ],
        )
      ],
    );
  }
}
