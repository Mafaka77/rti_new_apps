import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/models/my_rti_model.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class RtiScreen extends StatelessWidget {
  const RtiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RtiController>(
        init: RtiController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => controller.isRtiLoading.isTrue
                  ? rtiListLoader()
                  : ListView.separated(
                      separatorBuilder: (context, index) => sizedBoxHeight(15),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.myRtiList.length,
                      itemBuilder: (c, i) {
                        var data = controller.myRtiList[i];
                        return InkWell(
                          splashColor: MyColor.green,
                          onTap: () {
                            controller.getRtiDetails(data.id!, () {
                              print(data.id);
                              showLoader(context);
                            }, () {
                              hideLoader();
                              Get.toNamed('/rti-detail-screen');
                            }, () {
                              hideLoader();
                            });
                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Image(
                                              height: 20,
                                              image: AssetImage(
                                                  'images/file.png')),
                                          rtiStatus(data),
                                        ],
                                      ),
                                      const Divider(),
                                      const Text(
                                        'Question:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      AutoSizeText(
                                        data.citizen_question.toString(),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Submitted On:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      sizedBoxWidth(5),
                                      Text(DateFormat('dd-MMM-yyyy hh:mm a')
                                          .format(DateTime.parse(
                                              data.created_at!))),
                                    ],
                                  ),
                                ),
                                data.departmentModel != null
                                    ? Container(
                                        width: Get.width,
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(10),
                                        child: Wrap(
                                          children: [
                                            const Text(
                                              'Department:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            sizedBoxWidth(5),
                                            Text(
                                              data.departmentModel!.name,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Local Council:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            sizedBoxWidth(5),
                                            Text(data.local_council!.name
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                // rtiStatus(data),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          );
        });
  }

  Widget rtiStatus(MyRtiModel data) {
    if (data.second_appeal_cic_answer != null) {
      return Container(
        color: Colors.green[50],
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: const Center(
          child: Text(
            'Answered by CIC',
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
    }
    if (data.second_appeal_cic_in != null) {
      return Container(
        color: Colors.orange[50],
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: const Center(
          child: Text(
            'Under Process by CIC',
            style: TextStyle(color: Colors.orange),
          ),
        ),
      );
    }
    if (data.first_appeal_daa_answer != null) {
      return Container(
        color: Colors.green[50],
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: const Center(
          child: Text(
            'Answered by DAA',
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
    }
    if (data.first_appeal_daa_in != null) {
      return Container(
        color: Colors.orange[50],
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: const Center(
          child: Text(
            'Under Process by DAA',
            style: TextStyle(color: Colors.orange),
          ),
        ),
      );
    }
    if (data.spio_answer != null) {
      return Container(
        color: Colors.green[50],
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: const Center(
          child: Text(
            'Answered by SPIO',
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
    }

    return Container(
      color: Colors.orange[50],
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: const Center(
        child: Text(
          'Under Process by SPIO',
          style: TextStyle(color: Colors.orange),
        ),
      ),
    );
  }
}
