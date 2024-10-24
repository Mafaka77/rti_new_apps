import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/home_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class StatisticsWidget extends GetView<HomeController> {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.statsData;
    var date = controller.statsDate;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Obx(
        () => controller.isStatsLoading.isTrue
            ? Container()
            : Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 10,
                        color: MyColor.green,
                      ),
                      sizedBoxWidth(5),
                      const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('Online RTI Count')),
                    ],
                  ),
                  sizedBoxHeight(10),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Today',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data['today'].toString(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: MyColor.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Card(
                        borderOnForeground: true,
                        color: MyColor.lightGreen,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(date['today'] ?? '')),
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight(10),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Week',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data['week'].toString(),
                              style: TextStyle(
                                fontSize: 24,
                                color: MyColor.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Card(
                        borderOnForeground: true,
                        color: MyColor.lightGreen,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                                '${date['week_start']} - ${date['week_end']}'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight(10),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Month',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data['month'].toString(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: MyColor.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Card(
                        borderOnForeground: true,
                        color: MyColor.lightGreen,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(date['month'])),
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight(10),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Year',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data['year'].toString(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: MyColor.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Card(
                        borderOnForeground: true,
                        color: MyColor.lightGreen,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                              fit: BoxFit.scaleDown, child: Text(date['year'])),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
