import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rti_new_apps/controllers/track_controller.dart';
import 'package:rti_new_apps/screens/complain_screen.dart';
import 'package:rti_new_apps/screens/rti_screen.dart';
import 'package:rti_new_apps/widgets/home/home_app_bar_widget.dart';
import 'package:rti_new_apps/widgets/home/home_tab_widget.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrackController>(
      init: TrackController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  AppBarWidget(
                    title: 'track',
                  ),
                  sizedBoxHeight(20),
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
      },
    );
  }
}
