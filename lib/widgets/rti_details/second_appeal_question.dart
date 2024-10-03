import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/services/routes.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class SecondAppealQuestionWidget extends GetView<RtiController> {
  const SecondAppealQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      controller: controller.secondAppealTileController,
      expandedAlignment: Alignment.topLeft,
      childrenPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      shape: const RoundedRectangleBorder(),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      dense: true,
      title: const Text(
        'Second Appeal Question',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              data.second_appeal_citizen_question.toString(),
              maxLines: 10,
            ),
            const Divider(
              endIndent: 10,
              indent: 10,
            ),
            Wrap(
              children: [
                const Text(
                  'Attachment: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                data.second_appeal_citizen_question_file != null
                    ? Text(data.second_appeal_citizen_question_file!)
                    : const Text('N/A')
              ],
            ),
            data.second_appeal_citizen_question_file != null
                ? MaterialButton(
                    elevation: 0,
                    color: MyColor.green,
                    onPressed: () {
                      print('Download');
                      downloadFile(context,
                          data.second_appeal_citizen_question_file, controller);
                    },
                    child: const Text(
                      'DOWNLOAD',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
