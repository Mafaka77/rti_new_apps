import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/local_council_wise_controller.dart';

class LocalCouncilLibertyWidget extends GetView<LocalCouncilWiseController> {
  const LocalCouncilLibertyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: Colors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Provision of Section 7(1) of the RTI Act, 2005:',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                    '(1) Subject to the proviso to sub‑section (2) of section 5 or the proviso to sub­-section (3) of section 6, the Central Public Information Officer or State Public Information Officer, as the case may be on receipt of a request under section 6 shall, as expeditiously as possible, and in any case within thirty days of the receipt of the request, either provide the information on payment of such fee as may be prescribed or reject the request for any of the reasons specified in sections 8 and 9: Provided that where the information sought for concerns the life or liberty of a person, the same shall be provided within forty‑eight hours of the receipt of the request.'),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        activeColor: MyColor.green,
                        value: controller.isLibertyChecked.value,
                        onChanged: (value) {
                          controller.isLibertyChecked.value = value!;
                        },
                      ),
                    ),
                    const Text('I understand the consequences'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
