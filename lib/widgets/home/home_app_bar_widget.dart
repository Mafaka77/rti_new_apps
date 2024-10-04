import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/nav_bar_controller.dart';

class AppBarWidget extends GetView<NavBarController> {
  String title;
  AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: title == 'track' ? Colors.transparent : MyColor.green,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            height: 40,
            color: title == 'track' ? Colors.blue : Colors.white,
            'images/logo.svg',
          ),
          IconButton(
            onPressed: () {
              Get.toNamed("/profile-screen/10");
            },
            icon: SvgPicture.asset(
              height: 40,
              color: title == 'track' ? Colors.blue : Colors.white,
              'images/profile.svg',
            ),
          )
        ],
      ),
    );
  }
}
