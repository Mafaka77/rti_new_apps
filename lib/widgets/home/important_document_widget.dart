import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/home_controller.dart';
import 'package:rti_new_apps/services/routes.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class ImportantDocumentWidget extends GetView<HomeController> {
  const ImportantDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 5,
                  height: 10,
                  color: MyColor.green,
                ),
                sizedBoxWidth(5),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('Important Documents'),
                ),
              ],
            ),
            sizedBoxHeight(20),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 10),
              shrinkWrap: true,
              itemCount: controller.pdfList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                var data = controller.pdfList[i];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (i != 2) {
                          downloadFile(context, data['url'], data['file_name']);
                        } else {
                          Get.toNamed('/terms-screen');
                        }
                      },
                      child: Container(
                        height: Get.height * 0.09,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Center(
                            child: Image(
                              image: AssetImage(data['icon']!),
                            ),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight(10),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(data['name']!),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void downloadFile(BuildContext context, String? url, String? fileName) async {
    // try {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    final Directory directory = await getApplicationDocumentsDirectory();
    // final Directory directory = Directory('/storage/emulated/0/Download/Rti');
    String filePath = '${directory.path}/$fileName';
    Dio dio = Dio();
    // ignore: use_build_context_synchronously
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'File Downloading...');
    await dio.download(
      url!,
      filePath,
      onReceiveProgress: (count, total) {
        if (total != -1) {
          controller.downloadPercentage.value = ((count / total * 100).toInt());
          pd.update(value: controller.downloadPercentage.value);
        }
      },
    );

    OpenFile.open(filePath);
    showDownloadSuccessSnackBar(
        'Success',
        'File downloaded successfully',
        const Icon(
          Icons.check,
          color: Colors.blue,
        ),
        filePath);
    // } catch (ex) {}
  }
}
