import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/auth_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class ChangePasswordScreen extends GetView<AuthController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var phone = Get.parameters['phone'];
    print(phone);
    return Scaffold(
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
                  height: Get.height * 0.35,
                ),
                const Positioned(
                  bottom: 30,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RESET PASSWORD',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      // reusableWidget.twoLine(),
                    ],
                  ),
                ),
              ],
            ),
            sizedBoxHeight(10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: controller.resetPasswordFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Obx(
                      () => TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        controller: controller.resetPasswordText,
                        obscureText: controller.isResetPasswordHidden.value,
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          isDense: true,
                          border: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isResetPasswordHidden.value =
                                  !controller.isResetPasswordHidden.value;
                            },
                            icon: Icon(
                              controller.isResetPasswordHidden.isTrue
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        controller: controller.confirmResetPasswordText,
                        obscureText:
                            controller.isConfirmResetPasswordHidden.value,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          isDense: true,
                          border: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isConfirmResetPasswordHidden.value =
                                  !controller
                                      .isConfirmResetPasswordHidden.value;
                            },
                            icon: Icon(
                              controller.isConfirmResetPasswordHidden.isTrue
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
                            resetPassword(
                                context, controller, phone.toString());
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reset Password',
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
            ),
          ],
        ),
      ),
    );
  }

  void resetPassword(
      BuildContext context, AuthController controller, String phone) {
    if (controller.resetPasswordFormKey.currentState!.validate()) {
      if (controller.resetPasswordText.text !=
          controller.confirmResetPasswordText.text) {
        ScaffoldMessenger.of(context)
            .showSnackBar(myWarningSnackBar('Warning', 'Password not same'));
      } else {
        controller.resetPassword(phone, () {
          showLoader(context);
        }, (String message) {
          hideLoader();
          ScaffoldMessenger.of(context)
              .showSnackBar(mySuccessSnackBar('Success', message));
          Get.offAllNamed('/login-screen');
        }, (String message) {
          hideLoader();
          ScaffoldMessenger.of(context)
              .showSnackBar(myErrorSnackBar('Error', message));
        });
      }
    }
  }
}
