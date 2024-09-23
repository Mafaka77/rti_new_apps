import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/auth_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class RegisterScreen extends GetView<AuthController> {
  RegisterScreen({super.key});
  var mobile = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.elliptical(400, 140)),
                    color: MyColor.green,
                  ),
                  height: Get.height * 0.2,
                ),
                const Positioned(
                  bottom: 30,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      // reusableWidget.twoLine(),
                    ],
                  ),
                ),
              ],
            ),
            Form(
              key: controller.registerFormKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      controller: controller.registerNameText,
                      decoration: InputDecoration(
                        border: textBoxFocusBorder(),
                        enabledBorder: textBoxFocusBorder(),
                        focusedBorder: textBoxFocusBorder(),
                        labelText: 'Full Name',
                        isDense: true,
                      ),
                    ),
                    sizedBoxHeight(10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      controller: controller.registerEmailText,
                      decoration: InputDecoration(
                        border: textBoxFocusBorder(),
                        enabledBorder: textBoxFocusBorder(),
                        focusedBorder: textBoxFocusBorder(),
                        labelText: 'Email',
                        isDense: true,
                      ),
                    ),
                    sizedBoxHeight(10),
                    TextFormField(
                      readOnly: true,
                      initialValue: mobile,
                      decoration: InputDecoration(
                        border: textBoxFocusBorder(),
                        enabledBorder: textBoxFocusBorder(),
                        focusedBorder: textBoxFocusBorder(),
                        labelText: 'Mobile',
                        isDense: true,
                      ),
                    ),
                    sizedBoxHeight(10),
                    Obx(
                      () => TextFormField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter Password';
                          } else if (val.length < 8) {
                            return 'Password must be greater than 8 characters';
                          }
                          return null;
                        },
                        controller: controller.registerPasswordText,
                        obscureText: controller.isRegisterPasswordHidden.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          isDense: true,
                          border: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isRegisterPasswordHidden.value =
                                  !controller.isRegisterPasswordHidden.value;
                              controller.update();
                            },
                            icon: controller.isRegisterPasswordHidden.isTrue
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          height: Get.height * 0.06,
                          elevation: 0,
                          color: MyColor.green,
                          minWidth: Get.width * 0.5,
                          onPressed: () {
                            if (controller.registerFormKey.currentState!
                                .validate()) {
                              controller.register(() {
                                showLoader(context);
                              }, (String message) {
                                hideLoader();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    mySuccessSnackBar('Success', message));
                                Get.offAndToNamed('/login-screen');
                              }, (String message) {
                                hideLoader();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    myErrorSnackBar('Error', message));
                              },
                                  controller.registerNameText.text,
                                  controller.registerEmailText.text,
                                  mobile,
                                  controller.registerPasswordText.text);
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
