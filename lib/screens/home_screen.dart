import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/home_controller.dart';
import 'package:rti_new_apps/middlewares/auth_middleware.dart';
import 'package:rti_new_apps/screens/complain_screen.dart';
import 'package:rti_new_apps/screens/rti_screen.dart';
import 'package:rti_new_apps/widgets/home/home_app_bar_widget.dart';
import 'package:rti_new_apps/widgets/home/home_tab_widget.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            floatingActionButtonLocation: ExpandableFab.location,
            floatingActionButton: ExpandableFab(
                key: controller.key,
                type: ExpandableFabType.up,
                pos: ExpandableFabPos.right,
                distance: 70,
                openButtonBuilder: FloatingActionButtonBuilder(
                    size: 40,
                    builder: (context, toggle, Animation) {
                      return MaterialButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: MyColor.green,
                        onPressed: () {
                          toggle!();
                        },
                        child: const Text(
                          'APPLY',
                          style: TextStyle(
                            fontSize: 17,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                closeButtonBuilder: FloatingActionButtonBuilder(
                    size: 40,
                    builder: (context, toggle, Animation) {
                      return MaterialButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: MyColor.orange,
                        onPressed: () {
                          toggle!();
                        },
                        child: const Text(
                          'CLOSE',
                          style: TextStyle(
                            fontSize: 17,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                children: [
                  FloatingActionButton.extended(
                    backgroundColor: MyColor.green,
                    elevation: 0,
                    heroTag: null,
                    label: const Text('Submit Complaint'),
                    onPressed: () {
                      final state = controller.key.currentState;
                      if (state != null) {
                        state.toggle();
                      }
                    },
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: MyColor.green,
                    elevation: 0,
                    heroTag: null,
                    label: const Text('Submit RTI'),
                    onPressed: () {
                      final state = controller.key.currentState;
                      if (state != null) {
                        state.toggle();
                      }
                      Get.toNamed('/submit-rti-screen');
                    },
                  ),
                ]),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeAppBarWidget(),
                    const HomeTabWidget(),
                    Obx(
                      () => controller.isRtiSelected.isTrue
                          ? const RtiScreen()
                          : Container(),
                    ),
                    Obx(
                      () => controller.isComplainSelected.isTrue
                          ? const ComplainScreen()
                          : Container(),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
// DefaultFloatingActionButtonBuilder(
//                   backgroundColor: MyColor.green,
//                   fabSize: ExpandableFabSize.regular,
//                   foregroundColor: Colors.white,
//                   child: const Text(
//                     'APPLY',
//                   ),
//                 ),