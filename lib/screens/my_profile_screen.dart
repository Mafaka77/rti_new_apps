import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/profile_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class MyProfileScreen extends GetView<ProfileController> {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 80,
                  child: Image(
                    image: AssetImage(
                      'images/user.png',
                    ),
                  ),
                ),
              ),
              sizedBoxHeight(20),
              TextFormField(
                controller: controller.nameText,
                decoration: InputDecoration(
                  isDense: true,
                  border: textBoxFocusBorder(),
                  enabledBorder: textBoxFocusBorder(),
                  focusedBorder: textBoxFocusBorder(),
                  hintText: 'Name',
                ),
              ),
              sizedBoxHeight(10),
              TextFormField(
                readOnly: true,
                controller: controller.emailText,
                decoration: InputDecoration(
                  isDense: true,
                  border: textBoxFocusBorder(),
                  enabledBorder: textBoxFocusBorder(),
                  focusedBorder: textBoxFocusBorder(),
                  hintText: 'Email',
                ),
              ),
              sizedBoxHeight(10),
              TextFormField(
                readOnly: true,
                controller: controller.mobileText,
                decoration: InputDecoration(
                  isDense: true,
                  border: textBoxFocusBorder(),
                  enabledBorder: textBoxFocusBorder(),
                  focusedBorder: textBoxFocusBorder(),
                  hintText: 'Mobile',
                ),
              ),
              sizedBoxHeight(10),
              Obx(
                () => TextFormField(
                  controller: controller.oldPasswordText,
                  obscureText: controller.isOldPasswordHidden.value,
                  decoration: InputDecoration(
                    labelText: 'Enter Old Password',
                    isDense: true,
                    border: textBoxFocusBorder(),
                    enabledBorder: textBoxFocusBorder(),
                    focusedBorder: textBoxFocusBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.isOldPasswordHidden.value =
                            !controller.isOldPasswordHidden.value;
                      },
                      icon: Icon(
                        controller.isOldPasswordHidden.isTrue
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),
              sizedBoxHeight(10),
              Obx(
                () => TextFormField(
                  controller: controller.passwordText,
                  obscureText: controller.isPasswordHidden.value,
                  decoration: InputDecoration(
                    labelText: 'Enter new Password',
                    isDense: true,
                    border: textBoxFocusBorder(),
                    enabledBorder: textBoxFocusBorder(),
                    focusedBorder: textBoxFocusBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value;
                      },
                      icon: Icon(
                        controller.isPasswordHidden.isTrue
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),
              sizedBoxHeight(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: MyColor.green,
                      ),
                    ),
                    minWidth: Get.width * 0.4,
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('BACK'),
                  ),
                  MaterialButton(
                    elevation: 0,
                    color: MyColor.green,
                    minWidth: Get.width * 0.4,
                    onPressed: () {},
                    child: const Text(
                      'UPDATE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
