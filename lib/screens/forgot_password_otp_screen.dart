import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/auth_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class ForgotPasswordOtpScreen extends GetView<AuthController> {
  const ForgotPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: MyColor.green, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: MyColor.green),
        borderRadius: BorderRadius.circular(20),
      ),
    );
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
                        'OTP',
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
            sizedBoxHeight(20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Obx(
                    () => Form(
                      key: controller.forgotPasswordFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextFormField(
                        readOnly: controller.isOtpVisible.isTrue ? true : false,
                        controller: controller.otpMobileText,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty && value.length < 10 ||
                              value.length > 10) {
                            return 'Enter valid phone no';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          border: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          labelText: 'Phone No',
                          counterText: '',
                        ),
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                      ),
                    ),
                  ),
                  sizedBoxHeight(20),
                  Obx(
                    () => Visibility(
                      visible: controller.isOtpVisible.value,
                      child: Center(
                        child: Pinput(
                          length: 6,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty && value.length < 6) {
                              return 'Enter OTP';
                            }
                            return null;
                          },
                          defaultPinTheme: defaultPinTheme,
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          focusNode: controller.pinFocusNode,
                          controller: controller.otpText,
                          keyboardType: TextInputType.number,
                          onCompleted: (value) {
                            verifyOtp(
                                context, controller.otpMobileText.text, value);
                          },
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.isOtpVisible.isTrue
                        ? Container()
                        : Row(
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
                                  sendOtp(context);
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Send OTP',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
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
                  ),
                  sizedBoxHeight(20),
                  Obx(() => controller.isOtpVisible.isTrue
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                const Text("Didn't receive Code?"),
                                TextButton(
                                  onPressed: () {
                                    sendOtp(context);
                                  },
                                  child: const Text('Resend OTP'),
                                ),
                              ],
                            )
                          ],
                        )
                      : Container())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendOtp(BuildContext context) async {
    if (controller.forgotPasswordFormKey.currentState!.validate()) {
      controller.resetPasswordOtp(() {
        showLoader(context);
      }, (String message) {
        controller.isOtpVisible.value = true;
        ScaffoldMessenger.of(context)
            .showSnackBar(mySuccessSnackBar('SUCCESS', message));
        hideLoader();
      }, (String message) {
        controller.isOtpVisible.value = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(myErrorSnackBar('ERROR', message));
        hideLoader();
      });
    }
  }

  void verifyOtp(BuildContext context, String phone, String otp) {
    controller.resetPasswordVerifyOtp(phone, otp, () {
      showLoader(context);
    }, (String message) {
      hideLoader();
      ScaffoldMessenger.of(context)
          .showSnackBar(mySuccessSnackBar('Success', message));
      Get.toNamed('/change-password-screen/$phone');
    }, (String message) {
      hideLoader();
    });
  }
}
