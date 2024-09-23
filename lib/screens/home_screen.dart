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
                type: ExpandableFabType.up,
                pos: ExpandableFabPos.right,
                distance: 70,
                children: [
                  FloatingActionButton.extended(
                    elevation: 0,
                    heroTag: null,
                    label: const Text('Submit Complaint'),
                    onPressed: () {},
                  ),
                  FloatingActionButton.extended(
                    elevation: 0,
                    heroTag: null,
                    label: const Text('Submit RTI'),
                    onPressed: () {},
                  ),
                ]),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
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
