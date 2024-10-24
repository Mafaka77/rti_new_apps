import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/services/routes.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';
import 'package:rti_new_apps/widgets/rti_details/free_attachment_widget.dart';
import 'package:rti_new_apps/widgets/rti_details/paid_attachment_widget.dart';

class SpioAnswerWidget extends GetView<RtiController> {
  const SpioAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return ExpansionTile(
      controller: controller.spioAnswerTileController,
      onExpansionChanged: (value) {
        // if (value == true) {
        //   controller.questionTileController.collapse();
        //   controller.firstAppealTileController.collapse();
        //   controller.update();
        // }
      },
      backgroundColor: Colors.white,
      dense: true,
      maintainState: true,
      childrenPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: const RoundedRectangleBorder(),
      collapsedBackgroundColor: Colors.white,
      title: const Text(
        'SPIO Answer',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              data.spio_answer.toString(),
              maxLines: 100,
            ),
            const Divider(
              indent: 40,
              endIndent: 40,
            ),
            Wrap(
              children: [
                const Text(
                  ' Answered On:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                sizedBoxWidth(10),
                Text(
                  data.spio_out == null
                      ? 'N/A'
                      : DateFormat('dd-MMM-yyyy').format(
                          DateTime.parse(
                            data.spio_out.toString(),
                          ),
                        ),
                ),
              ],
            ),
            data.paid_attachments == null
                ? const FreeAttachmentWidget()
                : const PaidAttachmentWidget(),
            data.first_appeal_citizen_question != null
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        color: MyColor.green,
                        elevation: 0,
                        onPressed: () {
                          controller.firstAppealReason.clear();
                          controller.firstAppealAttachment = XFile('');
                          controller.firstAttachmentName.clear();
                          controller.isFirstAttachmentSelected.value = false;
                          openAppealDialog(context, data.id!);
                          // controller.spioAnswerTileController.collapse();
                        },
                        child: const Text(
                          'Appeal',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ],
    );
  }

  openAppealDialog(BuildContext context, int rtiId) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: MyColor.green,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.clear,
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizedBoxHeight(20),
                  TextFormField(
                    controller: controller.firstAppealReason,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    maxLines: 5,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: textBoxFocusBorder(),
                      focusedBorder: textBoxFocusBorder(),
                      border: textBoxFocusBorder(),
                      labelText: 'Enter your Appeal Question',
                    ),
                  ),
                  sizedBoxHeight(20),
                  TextFormField(
                    onTap: () {
                      openPickerModal(context, controller);
                    },
                    readOnly: true,
                    controller: controller.firstAttachmentName,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: textBoxFocusBorder(),
                      focusedBorder: textBoxFocusBorder(),
                      border: textBoxFocusBorder(),
                      labelText: 'Select File',
                      suffixIcon: Obx(
                        () => controller.isFirstAttachmentSelected.isTrue
                            ? IconButton(
                                onPressed: () {
                                  controller.firstAppealAttachment = XFile('');
                                  controller.firstAttachmentName.clear();
                                  controller.isFirstAttachmentSelected.value =
                                      false;
                                },
                                icon: const Icon(
                                  Icons.clear,
                                ),
                              )
                            : const Icon(
                                Icons.attachment,
                              ),
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
                      print(rtiId);
                      if (controller.formKey.currentState!.validate()) {
                        controller.submitFirstAppeal(rtiId, () {
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
                          Get.back();
                          hideLoader();
                          ScaffoldMessenger.of(context).showSnackBar(
                            myErrorSnackBar('Error', message),
                          );
                        });
                      }
                    },
                    child: const Text('SUBMIT'),
                  ),
                ],
              ),
            ),
          );
        });
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
      controller.firstAppealAttachment = image;
      controller.firstAttachmentName.text = image.name;
      controller.isFirstAttachmentSelected.value = true;
      Get.back();
    } else {}
  }

  void openCamera(RtiController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      controller.firstAppealAttachment = image;
      controller.firstAttachmentName.text = image.name;
      controller.isFirstAttachmentSelected.value = true;
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
      controller.firstAppealAttachment = file;
      controller.firstAttachmentName.text = file.name;
      controller.isFirstAttachmentSelected.value = true;
      Get.back();
      Get.back();
    } else {
      // User canceled the picker
    }
  }
}
