import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/auth_controller.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class VerifyOtpScreen extends GetView<AuthController> {
  VerifyOtpScreen({super.key});
  var mobileNo = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    print(mobileNo);
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

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: MyColor.green),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: MyColor.green,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('OTP Verification'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBoxHeight(30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Enter Verification Code',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Text('Enter the OTP Below'),
                    sizedBoxHeight(20),
                    Form(
                      key: controller.verifyOtpFormKey,
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
                            verifyOtp(context, mobileNo, value);
                          },
                        ),
                      ),
                    ),
                    sizedBoxHeight(20),
                    const Text("Didn't receive Code?"),
                    TextButton(
                      onPressed: () {
                        resendOtp(context, mobileNo);
                      },
                      child: const Text('Resend OTP'),
                    ),
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
                            verifyOtp(
                                context, mobileNo, controller.otpText.text);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Verify OTP',
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String mobile, String otp) {
    if (controller.verifyOtpFormKey.currentState!.validate()) {
      controller.verifyOtp(mobile, otp, () {
        showLoader(context);
      }, (String message) {
        hideLoader();
        ScaffoldMessenger.of(context)
            .showSnackBar(mySuccessSnackBar('SUCCESS', message));
        Get.toNamed('/register-screen', arguments: [mobile]);
      }, (String message) {
        hideLoader();
        ScaffoldMessenger.of(context)
            .showSnackBar(myErrorSnackBar('ERROR', message));
      });
    }
  }

  void resendOtp(BuildContext context, String mobile) {
    controller.resendOtp(mobile, () {
      showLoader(context);
    }, (String message) {
      hideLoader();
      ScaffoldMessenger.of(context)
          .showSnackBar(mySuccessSnackBar('SUCCESS', message));
    }, (String message) {
      hideLoader();
      ScaffoldMessenger.of(context)
          .showSnackBar(myErrorSnackBar('ERROR', message));
    });
  }
}
