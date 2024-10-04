import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/home_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class FaqWidget extends GetView<HomeController> {
  const FaqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 10,
                width: 5,
                color: MyColor.green,
              ),
              sizedBoxWidth(3),
              const Text('FAQ'),
            ],
          ),
          sizedBoxHeight(10),
          Obx(
            () => controller.isFaqLoading.isTrue
                ? rtiListLoader()
                : ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: controller.faqList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (c, i) {
                      var data = controller.faqList[i];
                      return ExpansionTile(
                        backgroundColor: Colors.white,
                        dense: true,
                        maintainState: true,
                        childrenPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        shape: const RoundedRectangleBorder(),
                        collapsedBackgroundColor: Colors.white,
                        title: Text(data.title!),
                        children: [
                          AutoSizeText(
                            data.body!,
                            maxLines: 10,
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
