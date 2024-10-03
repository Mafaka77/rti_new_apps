import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/track_controller.dart';
import 'package:rti_new_apps/screens/complain_screen.dart';
import 'package:rti_new_apps/screens/rti_screen.dart';
import 'package:rti_new_apps/widgets/home/home_app_bar_widget.dart';
import 'package:rti_new_apps/widgets/home/home_tab_widget.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrackController>(
      init: TrackController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          appBar: homeAppBarWidget(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
