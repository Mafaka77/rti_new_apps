import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/auth_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class OtpScreen extends GetView<AuthController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Form(
              key: controller.otpFormKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
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
                            sendOtp(context);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendOtp(BuildContext context) async {
    if (controller.otpFormKey.currentState!.validate()) {
      controller.sendOtp(() {
        showLoader(context);
      }, (String message) {
        ScaffoldMessenger.of(context)
            .showSnackBar(mySuccessSnackBar('SUCCESS', message));
        hideLoader();
        Get.toNamed('/verify-otp-screen',
            arguments: [controller.otpMobileText.text]);
      }, (String message) {
        ScaffoldMessenger.of(context)
            .showSnackBar(myErrorSnackBar('ERROR', message));
        hideLoader();
      });
    }
  }
}
