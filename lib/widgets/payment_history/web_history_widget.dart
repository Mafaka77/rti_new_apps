import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rti_new_apps/controllers/web_history_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class WebHistoryWidget extends StatelessWidget {
  const WebHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebHistoryController>(
        init: WebHistoryController(),
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.only(top: 20),
            child: Obx(() => controller.isLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.webPayments.isEmpty
                    ? const Center(
                        child: Text('No Data'),
                      )
                    : SizedBox(
                        height: Get.height * 0.8,
                        child: SmartRefresher(
                          enablePullDown: true,
                          enablePullUp: true,
                          header: const WaterDropHeader(),
                          controller: controller.refreshController,
                          onRefresh: controller.onRefresh,
                          onLoading: controller.onLoading,
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  sizedBoxHeight(10),
                              physics: const AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.webPayments.length,
                              itemBuilder: (c, i) {
                                var data = controller.webPayments[i];

                                return ExpansionTile(
                                  shape: const RoundedRectangleBorder(),
                                  tilePadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  expandedAlignment: Alignment.topLeft,
                                  backgroundColor: Colors.white,
                                  collapsedBackgroundColor: Colors.white,
                                  dense: true,
                                  title: Text(data.order_id!),
                                  children: [
                                    ListTile(
                                      leading: const Text('Tracking ID:'),
                                      title: Text(data.tracking_id!),
                                    ),
                                    ListTile(
                                      leading: const Text('Order ID:'),
                                      title: Text(data.order_id!),
                                    ),
                                    ListTile(
                                      leading: const Text('Status:'),
                                      title: Text(data.order_status!),
                                    ),
                                    ListTile(
                                      leading: const Text('Amount:'),
                                      title: Text(data.amount!),
                                    ),
                                    ListTile(
                                      leading: const Text('Date:'),
                                      title: Text(
                                        DateFormat('dd-MMM-yyyy hh:mm a')
                                            .format(
                                          DateTime.parse(data.created_at!),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              }),
                        ),
                      )),
          );
        });
  }
}
