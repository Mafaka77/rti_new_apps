import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rti_new_apps/router.dart';

final storage = GetStorage();

class AuthMiddleware extends GetMiddleware {
  var token = storage.read('token');

  @override
  RouteSettings? redirect(String? route) {
    return token == null ? const RouteSettings(name: '/login-screen') : null;
  }
}
