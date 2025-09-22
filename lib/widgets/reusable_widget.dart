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
import 'package:rti_new_apps/controllers/complain_controller.dart';
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

fileRtiLoader() {
  return Positioned(
    bottom: -80, // Overflowing the bottom of the container
    left: 30,
    child: Container(
      width: Get.width * 0.4,
      height: Get.height * 0.2,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Shimmer.fromColors(
              baseColor: Colors.black45,
              highlightColor: MyColor.limeGreen,
              child: Container(
                color: Colors.green[50],
              ),
            ),
          ),
          sizedBoxHeight(10),
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.02,
              color: Colors.green[50],
            ),
          ),
          sizedBoxHeight(10),
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.02,
              color: Colors.green[50],
            ),
          ),
          sizedBoxHeight(10),
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.02,
              color: Colors.green[50],
            ),
          ),
        ],
      ),
    ),
  );
}

fileComplaintLoader() {
  return Positioned(
    bottom: -80, // Overflowing the bottom of the container
    right: 30,
    child: Container(
      width: Get.width * 0.4,
      height: Get.height * 0.2,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Shimmer.fromColors(
              baseColor: Colors.black45,
              highlightColor: MyColor.limeGreen,
              child: Container(
                color: Colors.green[50],
              ),
            ),
          ),
          sizedBoxHeight(10),
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.02,
              color: Colors.green[50],
            ),
          ),
          sizedBoxHeight(10),
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.02,
              color: Colors.green[50],
            ),
          ),
          sizedBoxHeight(10),
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.02,
              color: Colors.green[50],
            ),
          ),
        ],
      ),
    ),
  );
}

statsLoader() {
  return Positioned(
    bottom: -80, // Overflowing the bottom of the container
    right: 30,
    child: Container(
      width: Get.width * 0.4,
      height: Get.height * 0.2,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Shimmer.fromColors(
              baseColor: Colors.black45,
              highlightColor: MyColor.limeGreen,
              child: Container(
                color: Colors.green[50],
              ),
            ),
          ),
          sizedBoxHeight(10),
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.02,
              color: Colors.green[50],
            ),
          ),
          sizedBoxHeight(10),
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.02,
              color: Colors.green[50],
            ),
          ),
          sizedBoxHeight(10),
          Shimmer.fromColors(
            baseColor: Colors.black45,
            highlightColor: MyColor.limeGreen,
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.02,
              color: Colors.green[50],
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> downloadFile(
    BuildContext context, String? file, RtiController controller) async {
  if (file == null || file.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("No file to download")),
    );
    return;
  }

  // Split comma-separated list into filenames
  final files =
      file.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();

  if (files.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("No valid filenames found")),
    );
    return;
  }

  // Request storage permission on Android only
  if (Platform.isAndroid) {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Storage permission denied")),
      );
      return;
    }
  }

  // Choose save directory
  Directory baseDir;
  if (Platform.isAndroid) {
    baseDir = (await getExternalStorageDirectory()) ??
        await getApplicationDocumentsDirectory();
  } else {
    baseDir = await getApplicationDocumentsDirectory();
  }

  final saveDir = Directory("${baseDir.path}/RtiDownloads");
  if (!await saveDir.exists()) {
    await saveDir.create(recursive: true);
  }

  final dio = Dio();
  final ProgressDialog pd = ProgressDialog(context: context);

  try {
    // Show dialog
    pd.show(max: 100, msg: 'Starting download...');

    final int totalFiles = files.length;
    controller.downloadPercentage.value = 0;

    for (var i = 0; i < totalFiles; i++) {
      final fileName = files[i];
      final savePath = "${saveDir.path}/$fileName";
      final url = Routes.DOWNLOAD_URL(fileName);

      // Per-file download
      try {
        await dio.download(
          url,
          savePath,
          onReceiveProgress: (received, total) {
            final filePercent =
                (total > 0) ? ((received / total) * 100).toInt() : 0;

            // Compute overall percent: completed files + current file fraction
            final alreadyDonePercent = (i * 100);
            // average across totalFiles, so divide sum by totalFiles
            final overallPercent =
                ((alreadyDonePercent + filePercent) ~/ totalFiles)
                    .clamp(0, 100);

            // Update controller & dialog when changed (reduces UI churn)
            if (controller.downloadPercentage.value != overallPercent) {
              controller.downloadPercentage.value = overallPercent;
              // ignore: use_build_context_synchronously
              pd.update(
                  value: overallPercent,
                  msg: 'Downloading $fileName ($filePercent%)');
            }
          },
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: true,
            receiveTimeout: const Duration(seconds: 0),
          ),
        );

        // Open the file after successful download
        await OpenFile.open(savePath);

        // notify user per file
        // ignore: use_build_context_synchronously
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Downloaded: $fileName")),
        // );
      } catch (e) {
        debugPrint("Error downloading $fileName: $e");
        // continue with next file after notifying user
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to download: $fileName")),
        );
      }

      // Update completed percent after each file finishes (or fails)
      final completedPercent =
          ((((i + 1) / totalFiles) * 100).toInt()).clamp(0, 100);
      controller.downloadPercentage.value = completedPercent;
      // ignore: use_build_context_synchronously
      pd.update(
          value: completedPercent, msg: 'Completed ${i + 1} of $totalFiles');
    }

    // Finalize
    controller.downloadPercentage.value = 100;
    // ignore: use_build_context_synchronously
    pd.close();

    // Final success snackbar with folder path
    // ignore: use_build_context_synchronously
    showDownloadSuccessSnackBar(
      'Success',
      'Files downloaded successfully',
      const Icon(Icons.check, color: Colors.blue),
      saveDir.path,
    );
  } catch (e, st) {
    debugPrint('Batch download error: $e\n$st');
    try {
      pd.close();
    } catch (_) {}
    // ignore: use_build_context_synchronously
    myErrorSnackBar('Error', 'Download Failed');
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text("Download failed: $e")),
    // );
  } finally {
    // ensure dialog closed in any case
    try {
      pd.close();
    } catch (_) {}
  }
}
// void downloadFile(
//     BuildContext context, String? file, RtiController controller) async {
//   // try {
//   var status = await Permission.storage.status;
//   if (!status.isGranted) {
//     await Permission.storage.request();
//   }
//   final Directory directory = await getApplicationDocumentsDirectory();
//   // final Directory directory = Directory('/storage/emulated/0/Download/Rti');
//   String filePath = '${directory.path}/$file';
//   Dio dio = Dio();
//   // ignore: use_build_context_synchronously
//   ProgressDialog pd = ProgressDialog(context: context);
//   pd.show(max: 100, msg: 'File Downloading...');
//   await dio.download(
//     Routes.DOWNLOAD_URL(file!),
//     filePath,
//     onReceiveProgress: (count, total) {
//       if (total != -1) {
//         controller.downloadPercentage.value = ((count / total * 100).toInt());
//         pd.update(value: controller.downloadPercentage.value);
//       }
//     },
//   );

//   OpenFile.open(filePath);
//   showDownloadSuccessSnackBar(
//       'Success',
//       'File downloaded successfully',
//       const Icon(
//         Icons.check,
//         color: Colors.blue,
//       ),
//       filePath);
//   // } catch (ex) {}
// }

void downloadComplaintFile(
    BuildContext context, String? file, ComplainController controller) async {
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
