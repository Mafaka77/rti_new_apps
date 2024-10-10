import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rti_new_apps/controllers/auth_controller.dart';
import 'package:rti_new_apps/main.dart';
import 'package:rti_new_apps/router.dart';

class AuthMiddleware extends GetMiddleware {
  var token = storage.read('token');

  @override
  RouteSettings? redirect(String? route) {
    Get.put(AuthController());
    final authController = Get.find<AuthController>();
    if (!authController.isUserAuthenticated) {
      return const RouteSettings(name: '/login-screen');
    }
    return null;
  }
}
