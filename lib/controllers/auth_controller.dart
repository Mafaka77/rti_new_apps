import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/main.dart';
import 'package:rti_new_apps/middlewares/auth_middleware.dart';
import 'package:rti_new_apps/services/auth_services.dart';

class AuthController extends GetxController {
  AuthServices services = Get.find(tag: 'authServices');
  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final verifyOtpFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  var otpMobileText = TextEditingController();
  var emailText = TextEditingController();
  var passwordText = TextEditingController();
  var otpText = TextEditingController();
  var isPasswordHidden = true.obs;
  var isOtpVisible = false.obs;
  final FocusNode pinFocusNode = FocusNode();
  var isRegisterPasswordHidden = true.obs;
  var registerNameText = TextEditingController();
  var registerEmailText = TextEditingController();
  var registerPasswordText = TextEditingController();
  void sendOtp(Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.sendOtp(otpMobileText.text);
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 409) {
          onError(response.data['message']);
        }
      } else {
        onError('Error Occured');
      }
    } catch (ex) {
      print('ex');
      onError('Error Occured');
    }
  }

  void resendOtp(String mobile, Function onLoading, Function onSuccess,
      Function onError) async {
    onLoading();
    try {
      var response = await services.sendOtp(otpMobileText.text);
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess('OTP successfully sent');
        } else {
          onError('Error Occured');
        }
      } else {
        onError('Error Occured');
      }
    } catch (ex) {
      print(ex);
      onError('Error Occured');
    }
  }

  void verifyOtp(String mobile, String otp, Function onLoading,
      Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.verifyOtp(mobile, otp);
      if (response.statusCode == 200) {
        if (response.data['status'] == 400) {
          onError(response.data['message']);
        } else if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        }
      } else {
        onError('Something went wrong');
      }
    } catch (ex) {
      onError('Something went wrong');
    }
  }

  void login(Function onLoading, Function onSuccess, Function onError) async {
    try {
      var response = await services.login(emailText.text, passwordText.text);
      if (response.statusCode == 200) {
        switch (response.data['status']) {
          case 200:
            {
              await storage.write('token', response.data['access_token']);
              onSuccess(response.data['message']);
            }
          case 401:
            {
              onError(response.data['message']);
            }
          case 404:
            {
              onError(response.data['message']);
            }
          default:
            {
              onError(response.data['message']);
            }
        }
      } else {
        onError('Something went wrong');
      }
    } catch (ex) {
      print(ex);
      onError('Something went wrong');
    }
  }

  void register(Function onLoading, Function onSuccess, Function onError,
      String name, String email, String mobile, String password) async {
    onLoading();
    try {
      var response = await services.register(name, email, mobile, password);
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          print('Success');
          await storage.write('token', response.data['access_token']);
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 409) {
          onError(response.data['message']);
        }
      } else {
        print(response.statusCode);
        onError('Something went wrong!');
      }
    } catch (ex) {
      print(ex);
      onError('Something went wrong!');
    }
  }

  void resetPasswordOtp(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.resetPasswordOtp(otpMobileText.text);
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 404) {
          onError(response.data['message']);
        }
      } else {
        onError('Error Occured');
      }
    } catch (ex) {
      onError('Error Occured');
    }
  }

  Future resetPasswordVerifyOtp(String phone, String otp, Function onLoading,
      Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.resetPasswordVerifyOtp(phone, otp);
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 404) {
          onError(response.data['message']);
        } else {
          onError('Something went wrong');
        }
      } else {
        onError('Something went wrong');
      }
    } catch (ex) {
      print(ex);
      onError('Something went wrong');
    }
  }
}
