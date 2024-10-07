import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rti_new_apps/controllers/complain_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class ComplainScreen extends StatelessWidget {
  const ComplainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComplainController>(
        init: ComplainController(),
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Obx(() => controller.isLoading.isTrue
                ? rtiListLoader()
                : controller.complaintList.isEmpty
                    ? const Center(
                        child: Text('No Data'),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) =>
                            sizedBoxHeight(20),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.complaintList.length,
                        itemBuilder: (c, i) {
                          var data = controller.complaintList[i];
                          return GestureDetector(
                            onTap: () {
                              controller.getComplaintDetail(data.id!, () {
                                showLoader(context);
                              }, () {
                                hideLoader();
                                Get.toNamed('/complaint-detail-screen');
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
                                              image:
                                                  AssetImage('images/file.png'),
                                            ),
                                            data.second_appeal_cic_answer !=
                                                    null
                                                ? Container(
                                                    color: Colors.green[50],
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                    child: const Center(
                                                      child: Text(
                                                        'Answered by CIC ',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    color: Colors.orange[50],
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                    child: const Center(
                                                      child: Text(
                                                        'Under Process',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange),
                                                      ),
                                                    ),
                                                  ),
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

                                  // rtiStatus(data),
                                ],
                              ),
                            ),
                          );
                        })),
          );
        });
  }
}
