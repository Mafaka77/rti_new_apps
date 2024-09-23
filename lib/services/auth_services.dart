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
      return Future.error(ex);
    }
  }

  Future login(String email, String password) async {
    try {
      var response = await client.get(Routes.LOGIN, data: {
        'contact': email,
        'password': password,
      });
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }
}