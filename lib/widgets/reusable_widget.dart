import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pinput.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/services/routes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

sizedBoxHeight(double height) {
  return SizedBox(
    height: height,
  );
}

sizedBoxWidth(double width) {
  return SizedBox(
    width: width,
  );
}

showLoader(BuildContext context) {
  return Loader.show(context,
      overlayColor: Colors.transparent,
      progressIndicator: Platform.isIOS
          ? const CupertinoActivityIndicator(
              color: Colors.black,
              radius: 12,
            )
          : CircularProgressIndicator(
              color: MyColor.deepBlue,
            ),
      themeData: Theme.of(context).copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.green)));
}

hideLoader() {
  return Loader.hide();
}

showDownloadSuccessSnackBar(
    String title, String message, Icon icon, String filePath) {
  return Get.rawSnackbar(
    title: title,
    message: message,
    icon: icon,
    shouldIconPulse: true,
    backgroundColor: MyColor.green,
    padding: const EdgeInsets.all(10),
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 5),
    margin: const EdgeInsets.all(20),
    mainButton: MaterialButton(
      onPressed: () {
        print(filePath);
        OpenFile.open(filePath);
      },
      child: const Text('VIEW'),
    ),
  );
}

mySuccessSnackBar(String title, String message) => SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,

      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.success,
      ),
    );
myErrorSnackBar(String title, String message) => SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,

      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.failure,
      ),
    );
myWarningSnackBar(String title, String message) => SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,

      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.warning,
      ),
    );
textBoxFocusBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: MyColor.green,
      width: 1,
    ),
  );
}

rtiListLoader() {
  return Column(
    children: [
      ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (c, i) {
            return ListTile(
              title: Shimmer.fromColors(
                baseColor: Colors.black45,
                highlightColor: MyColor.limeGreen,
                enabled: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * 0.01,
                      color: Colors.green[50],
                    ),
                    sizedBoxHeight(30),
                    Container(
                      width: Get.width,
                      height: Get.height * 0.01,
                      color: Colors.green[50],
                    ),
                    sizedBoxHeight(30),
                    Container(
                      width: Get.width,
                      height: Get.height * 0.01,
                      color: Colors.green[50],
                    ),
                    sizedBoxHeight(30),
                    Container(
                      width: Get.width,
                      height: Get.height * 0.01,
                      color: Colors.green[50],
                    ),
                  ],
                ),
              ),
            );
          })
    ],
  );
}

nameLoader() {
  return Row(
    children: [
      CircleAvatar(
        radius: 10,
        child: Shimmer.fromColors(
          baseColor: Colors.black45,
          highlightColor: MyColor.limeGreen,
          child: Container(
            color: Colors.green[50],
          ),
        ),
      ),
      Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.2,
              height: Get.height * 0.01,
              color: Colors.green[50],
            ),
          ),
          sizedBoxHeight(10),
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.2,
              height: Get.height * 0.01,
              color: Colors.green[50],
            ),
          ),
        ],
      )
    ],
  );
}

void downloadFile(
    BuildContext context, String? file, RtiController controller) async {
  // try {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
  final Directory directory = await getApplicationDocumentsDirectory();
  // final Directory directory = Directory('/storage/emulated/0/Download/Rti');
  String filePath = '${directory.path}/$file';
  Dio dio = Dio();
  // ignore: use_build_context_synchronously
  ProgressDialog pd = ProgressDialog(context: context);
  pd.show(max: 100, msg: 'File Downloading...');
  await dio.download(
    Routes.DOWNLOAD_URL(file!),
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

myAppBarWidget() {
  return AppBar(
    backgroundColor: MyColor.lightGreen,
    leading: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    ),
  );
}

const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
const fillColor = Color.fromRGBO(243, 246, 249, 0);
const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
