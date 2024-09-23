import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/department_wise_controller.dart';
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
                  // DropdownSearch<DepartmentModel>(
                  //   key: controller.dropDownKey,
                  //   items: (filter, loadProps) =>
                  //       controller.getDepartment(filter),
                  // ),
                  CupertinoSearchTextField(
                    onTap: () {
                      print('On tap');
                    },
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: MyColor.green,
                      ),
                    ),
                  ),

                  sizedBoxHeight(10),
                  TextFormField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: textBoxFocusBorder(),
                      focusedBorder: textBoxFocusBorder(),
                      enabledBorder: textBoxFocusBorder(),
                      labelText: 'Zawhna',
                    ),
                  ),
                  sizedBoxHeight(10),
                  TextFormField(
                    onTap: () {
                      openPickerModal(context, controller);
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      border: textBoxFocusBorder(),
                      focusedBorder: textBoxFocusBorder(),
                      enabledBorder: textBoxFocusBorder(),
                      labelText: 'Attachment(Optional)',
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
                        'If it concerns the life or liberty of a person/\n Mi nunna emaw, zalenna khawih chungchang',
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
                          onPressed: () {},
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      : MaterialButton(
                          elevation: 0,
                          minWidth: Get.width,
                          height: 60,
                          color: MyColor.green,
                          onPressed: () {},
                          child: const Text(
                            'Make Payment',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )),
                  sizedBoxHeight(40),
                ],
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
              children: const [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.image_rounded), Text('Gallery')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.camera_alt_outlined), Text('Camera')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.file_copy_outlined), Text('File')],
                ),
              ],
            ),
          );
        });
  }
}
