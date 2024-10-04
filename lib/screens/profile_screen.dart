import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/profile_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      initState: (controller) {
        print(Get.parameters['user']);
      },
      builder: (controller) {
        return Scaffold(
          appBar: myAppBarWidget(),
          body: const SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        );
      },
    );
  }
}
