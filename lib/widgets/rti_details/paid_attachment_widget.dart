import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/services/routes.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class PaidAttachmentWidget extends GetView<RtiController> {
  const PaidAttachmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
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
                onPressed: () {
                  print(data.id);
                  createOrder(context, controller, data.id!);
                },
                child: const Text(
                  'PAY',
                  style: TextStyle(color: Colors.white),
                ),
              )
            :
            // TextButton(
            //     onPressed: () {
            //       downloadFile(context, data.spio_answer_file, controller);
            //     },
            //     child: Text(data.spio_answer_file!))
            MaterialButton(
                elevation: 0,
                color: MyColor.green,
                onPressed: () {
                  downloadFile(context, data.spio_answer_file, controller);
                },
                child: const Text(
                  'DOWNLOAD',
                  style: TextStyle(color: Colors.white),
                ),
              ),
      ],
    );
  }

  void createOrder(
    BuildContext context,
    RtiController controller,
    int id,
  ) {
    controller.createOrder(id, () {
      showLoader(context);
    }, () {
      hideLoader();
    }, (String message) {
      hideLoader();
      ScaffoldMessenger.of(context)
          .showSnackBar(myErrorSnackBar('Error', message));
    }, (String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(myErrorSnackBar('Error', message));
    });
  }
}
