import 'package:dio/dio.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class AuthServices extends BaseService {
  Future sendOtp(String mobile) async {
    // print(Routes.SEND_OTP);
    try {
      var response = await client.post(Routes.SEND_OTP, data: {
        'contact': mobile,
      });
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future verifyOtp(String mobile, String otp) async {
    try {
      var response = await client.post(Routes.VERIFY_OTP, data: {
        'contact': mobile,
        'otp': otp,
      });
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future register(
      String name, String email, String mobile, String password) async {
    try {
      var response = await client.post(Routes.REGISTER, data: {
        'name': name,
        'email': email,
        'contact': mobile,
        'password': password,
      });
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future login(String email, String password) async {
    try {
      // FormData formData = FormData.fromMap({
      //   'contact': email,
      //   'password': password,
      // });
      // print(formData.fields);
      var response = await client.get(
        Routes.LOGIN,
        // data: jsonData,
        queryParameters: {
          'contact': email,
          'password': password,
        },
        // data: {
        //   'contact': email,
        //   'password': password,
        // },
        // options: Options(
        //   contentType: Headers.jsonContentType,
        //   headers: {
        //     "Accept": "application/json",
        //   },
        // ),
      );
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future resetPasswordOtp(String phone) async {
    try {
      var response =
          await client.get(Routes.RESET_PASSWORD_OTP, queryParameters: {
        'phone': phone,
      });
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future resetPasswordVerifyOtp(String phone, String otp) async {
    try {
      var response = await client.post(Routes.RESET_PASSWORD_VERIFY_OTP, data: {
        'otp': otp,
        'phone': phone,
      });
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future resetPassword(String password, String phone) async {
    try {
      var response = await client.get(Routes.RESET_PASSWORD, queryParameters: {
        'newPassword': password,
        'phone': phone,
      });
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }
}
