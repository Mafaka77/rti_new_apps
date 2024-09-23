import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/department_wise_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class BplWidget extends GetView<DepartmentWiseController> {
  const BplWidget({super.key});

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
          TextFormField(
            onTap: () {
              openPickerModal(context, controller);
            },
            readOnly: true,
            decoration: InputDecoration(
              border: textBoxFocusBorder(),
              focusedBorder: textBoxFocusBorder(),
              enabledBorder: textBoxFocusBorder(),
              labelText: 'BPL Proof(Required)',
              suffixIcon: const Icon(Icons.attach_file),
            ),
          ),
        ],
      ),
    );
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
