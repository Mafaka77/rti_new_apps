import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/department_wise_controller.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/main.dart';
import 'package:rti_new_apps/middlewares/auth_middleware.dart';
import 'package:rti_new_apps/models/department_model.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';
import 'package:rti_new_apps/widgets/rti/bpl_widget.dart';
import 'package:rti_new_apps/widgets/rti/liberty_widget.dart';

class DepartmentRtiScreen extends StatelessWidget {
  const DepartmentRtiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepartmentWiseController>(
        init: DepartmentWiseController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // MaterialButton(
                    //   onPressed: () {
                    //     var token = storage.read('token');
                    //     print(token);
                    //   },
                    //   child: const Text('data'),
                    // ),
                    DropdownSearch<DepartmentModel>(
                      validator: (value) {
                        if (value == null) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.departmentId.value =
                            value == null ? 0 : value.id;
                        print(controller.departmentId.value);
                      },
                      suffixProps: DropdownSuffixProps(
                        clearButtonProps: const ClearButtonProps(
                          isSelected: true,
                          icon: Icon(
                            Icons.clear,
                          ),
                          isVisible: true,
                        ),
                        dropdownButtonProps: DropdownButtonProps(
                          iconClosed: Icon(
                            Icons.search,
                            color: MyColor.green,
                          ),
                          iconOpened: Icon(
                            Icons.search,
                            color: MyColor.green,
                          ),
                        ),
                      ),
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          isDense: true,
                          border: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          hintText: 'Department zawng rawh',
                        ),
                      ),
                      items: (filter, loadProps) async =>
                          await controller.getDepartment(filter),
                      compareFn: (item1, item2) => item1.isEqual(item2),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                          showSelectedItems: true,
                          showSearchBox: true,
                          listViewProps: const ListViewProps(
                            padding: EdgeInsets.all(20),
                          ),
                          searchFieldProps: TextFieldProps(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            decoration: InputDecoration(
                              isDense: true,
                              border: textBoxFocusBorder(),
                              enabledBorder: textBoxFocusBorder(),
                              focusedBorder: textBoxFocusBorder(),
                              hintText: 'Search',
                              suffixIcon: const Icon(Icons.search),
                            ),
                          )
                          // itemBuilder: userModelPopupItem,
                          ),
                    ),
                    sizedBoxHeight(10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      controller: controller.questionsText,
                      maxLines: 10,
                      decoration: InputDecoration(
                        isDense: true,
                        border: textBoxFocusBorder(),
                        focusedBorder: textBoxFocusBorder(),
                        enabledBorder: textBoxFocusBorder(),
                        labelText: 'I zawhna han ziak rawh le',
                      ),
                    ),
                    sizedBoxHeight(10),
                    Obx(
                      () => TextFormField(
                        controller: controller.attachmentName,
                        onTap: () {
                          openPickerModal(context, controller);
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          isDense: true,
                          border: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          labelText: 'Attachment(Optional)',
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
                    sizedBoxHeight(10),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Obx(
                          () => Switch(
                            activeColor: MyColor.green,
                            value: controller.isBpl.value,
                            onChanged: (val) {
                              controller.isBpl.value = val;
                            },
                          ),
                        ),
                        const Text(
                          'Below Poverty Line (BPL) ka ni e / \nI belong to Below Poverty Line (BPL) community',
                        )
                      ],
                    ),
                    sizedBoxHeight(10),
                    Obx(
                      () => controller.isBpl.isTrue
                          ? const BplWidget()
                          : Container(),
                    ),
                    sizedBoxHeight(10),
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Obx(
                          () => Switch(
                            activeColor: MyColor.green,
                            value: controller.isLiberty.value,
                            onChanged: (val) {
                              controller.isLiberty.value = val;
                              if (val == false) {
                                controller.isLibertyChecked.value = false;
                              }
                            },
                          ),
                        ),
                        const Text(
                          'If it concerns the life or liberty/\n Mi nunna emaw, zalenna khawih chungchang',
                        )
                      ],
                    ),
                    sizedBoxHeight(10),
                    Obx(() => controller.isLiberty.isTrue
                        ? const LibertyWidget()
                        : Container()),
                    sizedBoxHeight(10),
                    Obx(() => controller.isBpl.isTrue
                        ? MaterialButton(
                            elevation: 0,
                            minWidth: Get.width,
                            height: 60,
                            color: MyColor.green,
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                if (controller.bplAttachmentName.text == '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    myWarningSnackBar(
                                        'Warning', 'BPL Proof is required'),
                                  );
                                  return;
                                }
                                if (controller.isLiberty.isTrue) {
                                  if (controller.isLibertyChecked.isFalse) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      myWarningSnackBar('Warning',
                                          'Check "I understand the consequences"'),
                                    );
                                    return;
                                  }
                                }
                                submitFreeRti(context, controller);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  myWarningSnackBar('Required',
                                      'Please fill all required fields'),
                                );
                              }
                            },
                            child: const Text(
                              'Submit',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )
                        : MaterialButton(
                            elevation: 0,
                            minWidth: Get.width,
                            height: 60,
                            color: MyColor.green,
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                createOrder(context, controller);
                              }

                              // Get.toNamed('/payment-success-screen');
                            },
                            child: const Text(
                              'Make Payment',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )),
                    sizedBoxHeight(40),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void openPickerModal(
      BuildContext context, DepartmentWiseController controller) {
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

  void openGallery(DepartmentWiseController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.attachment = image;
      controller.attachmentName.text = image.name;
      controller.isAttachment.value = true;
      Get.back();
    } else {}
  }

  void openCamera(DepartmentWiseController controller) async {
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

  void openFile(DepartmentWiseController controller) async {
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

  void submitFreeRti(
      BuildContext context, DepartmentWiseController controller) async {
    controller.submitFreeRti(() {
      showLoader(context);
    }, (String message) {
      hideLoader();
      ScaffoldMessenger.of(context)
          .showSnackBar(mySuccessSnackBar('Success', message));
      // RtiController rtiController = Get.find();
      // rtiController.getMyRti();
      Get.back();
    }, (String message) {
      hideLoader();
      ScaffoldMessenger.of(context)
          .showSnackBar(myErrorSnackBar('Error', message));
    });
  }

  void createOrder(
      BuildContext context, DepartmentWiseController controller) async {
    controller.createOrder(() {
      showLoader(context);
    }, () {
      hideLoader();
    }, (String message) {
      hideLoader();
      ScaffoldMessenger.of(context)
          .showSnackBar(myErrorSnackBar('Error', message));
    });
  }
}
