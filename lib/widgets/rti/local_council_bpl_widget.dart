import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/controllers/local_council_wise_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class LocalCouncilBplWidget extends GetView<LocalCouncilWiseController> {
  const LocalCouncilBplWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Card(
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mizoram RTI Rules, 2010, Rule 6(a)\n',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'Persons who are of Below Poverty Line as may be determined by the State Government of Mizoram for provisions of information related to welfare of BPL.')
                ],
              ),
            ),
          ),
          sizedBoxHeight(10),
          Obx(
            () => TextFormField(
              controller: controller.bplAttachmentName,
              onTap: () {
                openPickerModal(context, controller);
              },
              readOnly: true,
              decoration: InputDecoration(
                isDense: true,
                border: textBoxFocusBorder(),
                focusedBorder: textBoxFocusBorder(),
                enabledBorder: textBoxFocusBorder(),
                labelText: 'BPL Proof(Required)',
                suffixIcon: controller.isBplAttachment.isTrue
                    ? IconButton(
                        onPressed: () {
                          controller.bplAttachment = XFile('');
                          controller.bplAttachmentName.clear();
                          controller.isBplAttachment.value = false;
                        },
                        icon: const Icon(Icons.clear))
                    : const Icon(Icons.attach_file),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openPickerModal(
      BuildContext context, LocalCouncilWiseController controller) {
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
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      Text('Camera'),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    openFile(controller);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.file_copy_outlined),
                      Text('File'),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void openCamera(LocalCouncilWiseController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      controller.bplAttachment = image;
      controller.bplAttachmentName.text = image.name;
      controller.isBplAttachment.value = true;
      Get.back();
    } else {}
  }

  void openGallery(LocalCouncilWiseController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.bplAttachment = image;
      controller.bplAttachmentName.text = image.name;
      controller.isBplAttachment.value = true;
      Get.back();
    } else {}
  }

  void openFile(LocalCouncilWiseController controller) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: [
      'pdf',
    ]);

    if (result != null) {
      XFile file = XFile(result.files.single.path!);
      controller.bplAttachment = file;
      controller.bplAttachmentName.text = file.name;
      controller.isBplAttachment.value = true;
      Get.back();
    } else {
      // User canceled the picker
    }
  }
}
