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

class SecondAppealAnswerWidget extends GetView<RtiController> {
  const SecondAppealAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return ExpansionTile(
      controller: controller.secondAppealAnswerTileController,
      dense: true,
      backgroundColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.topLeft,
      collapsedBackgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(),
      title: const Text(
        'Second Appeal Answer (CIC)',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                data.second_appeal_cic_answer.toString(),
                maxLines: 10,
              ),
              Wrap(
                children: [
                  const Text(
                    'Answer file: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  data.second_appeal_cic_answer_file != null
                      ? Text(data.second_appeal_cic_answer_file.toString())
                      : const Text('N/A')
                ],
              ),
              data.second_appeal_cic_answer_file != null
                  ? MaterialButton(
                      elevation: 0,
                      color: MyColor.green,
                      onPressed: () {
                        downloadFile(context,
                            data.second_appeal_cic_answer_file, controller);
                      },
                      child: const Text(
                        'DOWNLOAD',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Container(),
            ],
          ),
        )
      ],
    );
  }
}
