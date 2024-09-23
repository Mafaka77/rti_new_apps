import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/auth_controller.dart';
import 'package:rti_new_apps/screens/home_screen.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) {
            return SingleChildScrollView(
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
                        height: Get.height * 0.35,
                      ),
                      const Positioned(
                        bottom: 30,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOGIN',
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
                    key: controller.formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.emailText,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter valid email/phone';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: textBoxFocusBorder(),
                                focusedBorder: textBoxFocusBorder(),
                                border: textBoxFocusBorder(),
                                isDense: true,
                                labelText: 'Enter Phone/Email'),
                          ),
                          sizedBoxHeight(10),
                          Obx(
                            () => TextFormField(
                              controller: controller.passwordText,
                              obscureText: controller.isPasswordHidden.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
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
                                  login(context, controller);
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Login',
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
                          sizedBoxHeight(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("Don't have an account?"),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/otp-screen');
                                },
                                child: const Text('Register'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  void login(BuildContext context, AuthController controller) {
    if (controller.formKey.currentState!.validate()) {
      controller.login(() {
        showLoader(context);
      }, (String message) {
        hideLoader();
        Get.offAll(() => const HomeScreen());
        ScaffoldMessenger.of(context)
            .showSnackBar(mySuccessSnackBar('Success', message));
      }, (String message) {
        hideLoader();
        ScaffoldMessenger.of(context)
            .showSnackBar(myErrorSnackBar('Error', message));
      });
    }
  }
}
