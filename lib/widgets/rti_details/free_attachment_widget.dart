import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/services/routes.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class FreeAttachmentWidget extends GetView<RtiController> {
  const FreeAttachmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    print(data);
    return Wrap(
      children: [
        const Text(
          ' Answer File:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        sizedBoxWidth(10),
        data.spio_answer_file == null
            ? const Text('N/A')
            : IconButton(
                onPressed: () {
                  // downloadFile(context, data.spio_answer_file);
                },
                icon: const Icon(
                  Icons.download,
                ),
              ),
      ],
    );
  }

  // void downloadFile(
  //     BuildContext context, String? firstAppealCitizenQuestionFile) {
  //   FileDownloader.downloadFile(
  //     url: Routes.DOWNLOAD_URL(firstAppealCitizenQuestionFile!),
  //     name: firstAppealCitizenQuestionFile,
  //     onProgress: (fileName, progress) {
  //       print(progress);
  //       showDownloadLoader(context, progress);
  //       Get.rawSnackbar(message: progress.toString());
  //     },
  //     onDownloadCompleted: (path) {
  //       hideLoader();
  //       print(path);
  //     },
  //     onDownloadError: (errorMessage) {},
  //   );
  // }
}
