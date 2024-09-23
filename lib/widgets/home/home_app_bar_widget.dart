import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/home_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class HomeAppBarWidget extends GetView<HomeController> {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => controller.isMeLoading.isTrue
                ? const CircularProgressIndicator()
                : Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      sizedBoxWidth(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Welcome,'),
                          Text(controller.user.first.name.toString()),
                        ],
                      ),
                    ],
                  ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu_sharp))
        ],
      ),
    );
  }
}
