import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/nav_bar_controller.dart';

class AppBarWidget extends GetView<NavBarController> {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.green,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(
            height: 40,
            image: AssetImage('images/logo.png'),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_2_outlined))
        ],
      ),
    );
  }
}
