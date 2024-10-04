import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/nav_bar_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
      init: NavBarController(),
      builder: (controller) {
        return Scaffold(
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerFloat,
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {},
            // ),
            bottomNavigationBar: Obx(() => BottomNavigationBar(
                  items: controller.navBarList,
                  backgroundColor: Colors.white,
                  currentIndex: controller.selectedIndex.value,
                  enableFeedback: true,
                  selectedItemColor: MyColor.green,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.black,
                  showUnselectedLabels: true,
                  useLegacyColorScheme: true,
                  selectedIconTheme:
                      IconThemeData(color: MyColor.green, fill: 1),
                  onTap: (value) {
                    controller.selectedIndex.value = value;
                  },
                )),
            body: Obx(
              () => controller.widgetOptions
                  .elementAt(controller.selectedIndex.value),
            ));
      },
    );
  }
  //  AnimatedBottomNavigationBar.builder(
  //                 itemCount: controller.iconList.length,
  //                 tabBuilder: (index, isActive) {
  //                   return Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       controller.iconList[index].icon,
  //                       sizedBoxHeight(4),
  //                       Padding(
  //                         padding: const EdgeInsets.symmetric(
  //                           horizontal: 10,
  //                         ),
  //                         child: AutoSizeText(
  //                           controller.iconList[index].label!,
  //                           group: controller.autoSizeGroup,
  //                         ),
  //                       ),
  //                     ],
  //                   );
  //                 },
  //                 backgroundColor: MyColor.green,
  //                 activeIndex: controller.selectedIndex.value,
  //                 elevation: 0,
  //                 onTap: (i) {
  //                   controller.selectedIndex.value = i;
  //                 }),
}
