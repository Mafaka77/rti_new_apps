import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/submit_complaint_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class SubmitComplaintScreen extends StatelessWidget {
  const SubmitComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubmitComplaintController>(
      init: SubmitComplaintController(),
      builder: (controller) {
        return Scaffold(
          appBar: myAppBarWidget(),
          body: SingleChildScrollView(
            child: Form(
              key: controller.form,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.complaint,
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Required';
                        }
                        return null;
                      },
                      maxLines: 10,
                      decoration: InputDecoration(
                        isDense: true,
                        border: textBoxFocusBorder(),
                        focusedBorder: textBoxFocusBorder(),
                        enabledBorder: textBoxFocusBorder(),
                        hintText: 'Write your Complaint',
                      ),
                    ),
                    sizedBoxHeight(10),
                    Obx(
                      () => TextFormField(
                        onTap: () {
                          openPickerModal(context, controller);
                        },
                        controller: controller.attachmentName,
                        readOnly: true,
                        decoration: InputDecoration(
                          isDense: true,
                          border: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          hintText: 'Attachment(Optional)',
                          suffixIcon: controller.isAttachment.isTrue
                              ? IconButton(
                                  onPressed: () {
                                    controller.attachment = XFile('');
                                    controller.attachmentName.clear();
                                    controller.isAttachment.value = false;
                                  },
                                  icon: const Icon(Icons.clear),
                                )
                              : const Icon(Icons.attach_file),
                        ),
                      ),
                    ),
                    sizedBoxHeight(40),
                    MaterialButton(
                      elevation: 0,
                      minWidth: Get.width,
                      height: 50,
                      color: MyColor.green,
                      onPressed: () {
                        submitComplaint(context, controller);
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void openPickerModal(
      BuildContext context, SubmitComplaintController controller) {
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

  void openGallery(SubmitComplaintController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.attachment = image;
      controller.attachmentName.text = image.name;
      controller.isAttachment.value = true;
      Get.back();
    } else {}
  }

  void openCamera(SubmitComplaintController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      controller.attachment = image;
      controller.attachmentName.text = image.name;
      controller.isAttachment.value = true;
      Get.back();
    }
  }

  void openFile(SubmitComplaintController controller) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: [
      'pdf',
    ]);

    if (result != null) {
      XFile file = XFile(result.files.single.path!);
      controller.attachment = file;
      controller.attachmentName.text = file.name;
      controller.isAttachment.value = true;
      Get.back();
    } else {
      // User canceled the picker
    }
  }

  void submitComplaint(
      BuildContext context, SubmitComplaintController controller) {
    if (controller.form.currentState!.validate()) {
      controller.submitComplaint(() {
        showLoader(context);
      }, (String message) {
        ScaffoldMessenger.of(context).showSnackBar(
          mySuccessSnackBar('Success', message),
        );

        hideLoader();
        Get.back();
      }, (String message) {
        hideLoader();
        ScaffoldMessenger.of(context).showSnackBar(
          myErrorSnackBar('Error', message),
        );

        Get.back();
      });
    } else {}
  }
}
