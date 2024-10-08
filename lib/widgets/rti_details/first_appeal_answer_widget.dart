import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/services/routes.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class FirtAppealAnswerWidget extends GetView<RtiController> {
  const FirtAppealAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.topLeft,
      controller: controller.firstAppealAnswerTileController,
      collapsedBackgroundColor: Colors.white,
      title: const Text(
        'Firt Appeal Answer (DAA)',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      dense: true,
      onExpansionChanged: (value) {
        controller.questionTileController.collapse();
        controller.spioAnswerTileController.collapse();
        controller.firstAppealTileController.collapse();
      },
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                data.first_appeal_daa_answer.toString(),
                maxLines: 20,
              ),
              const Divider(
                indent: 50,
                endIndent: 50,
              ),
              Row(
                children: [
                  const Text(
                    'Answer File:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  data.first_appeal_daa_answer_file == null
                      ? const Text(' N/A')
                      : Text(
                          data.first_appeal_daa_answer_file.toString(),
                        ),
                ],
              ),
              data.first_appeal_daa_answer_file == null
                  ? Container()
                  : MaterialButton(
                      elevation: 0,
                      color: MyColor.green,
                      onPressed: () {
                        downloadFile(context, data.first_appeal_daa_answer_file,
                            controller);
                      },
                      child: const Text(
                        'DOWNLOAD',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
              data.second_appeal_cic_answer == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          elevation: 0,
                          color: MyColor.green,
                          onPressed: () {
                            openSecondAppealModal(
                                context, controller, data.id!);
                          },
                          child: const Text(
                            'APPEAL',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }

  openSecondAppealModal(
      BuildContext context, RtiController controller, int rtiId) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Form(
          key: controller.secondAppealFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: MyColor.green,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight(20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  controller: controller.secondAppealReason,
                  maxLines: 5,
                  decoration: InputDecoration(
                    isDense: true,
                    enabledBorder: textBoxFocusBorder(),
                    focusedBorder: textBoxFocusBorder(),
                    labelText: 'Enter reason for Appeal',
                  ),
                ),
                sizedBoxHeight(20),
                TextFormField(
                  controller: controller.secondAttachmentName,
                  onTap: () {
                    openPickerModal(context, controller);
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    enabledBorder: textBoxFocusBorder(),
                    focusedBorder: textBoxFocusBorder(),
                    labelText: 'Select file',
                    suffixIcon: Obx(
                      () => controller.isSecondAttachmentSelected.isTrue
                          ? IconButton(
                              onPressed: () {
                                controller.secondAttachmentName.clear();
                                controller.isSecondAttachmentSelected.value =
                                    false;
                                controller.secondAppealAttachment = XFile('');
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : const Icon(Icons.attachment),
                    ),
                  ),
                ),
                sizedBoxHeight(20),
                MaterialButton(
                  minWidth: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 0,
                  color: MyColor.green,
                  onPressed: () {
                    if (controller.secondAppealFormKey.currentState!
                        .validate()) {
                      controller.submitSecondAppeal(rtiId, () {
                        showLoader(context);
                      }, (String message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          mySuccessSnackBar('Success', message),
                        );
                        Get.back();
                        Get.back();
                        RtiController rtiController = Get.find();
                        rtiController.getMyRti();
                        hideLoader();
                      }, (String message) {
                        hideLoader();
                      });
                    }
                  },
                  child: const Text('SUBMIT'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void openPickerModal(BuildContext context, RtiController controller) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SizedBox(
            height: Get.height * 0.15,
            width: Get.width,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              children: [
                InkWell(
                  onTap: () {
                    openGallery(controller);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_rounded),
                      Text('Gallery'),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    openCamera(controller);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.camera_alt_outlined), Text('Camera')],
                  ),
                ),
                InkWell(
                  onTap: () {
                    openFile(controller);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.file_copy_outlined), Text('File')],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void openGallery(RtiController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.secondAppealAttachment = image;
      controller.secondAttachmentName.text = image.name;
      controller.isSecondAttachmentSelected.value = true;
      Get.back();
    } else {}
  }

  void openCamera(RtiController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      controller.secondAppealAttachment = image;
      controller.secondAttachmentName.text = image.name;
      controller.isSecondAttachmentSelected.value = true;
      Get.back();
    }
  }

  void openFile(RtiController controller) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: [
      'pdf',
    ]);

    if (result != null) {
      XFile file = XFile(result.files.single.path!);
      controller.secondAppealAttachment = file;
      controller.secondAttachmentName.text = file.name;
      controller.isSecondAttachmentSelected.value = true;
      Get.back();
      Get.back();
    } else {
      // User canceled the picker
    }
  }
}
