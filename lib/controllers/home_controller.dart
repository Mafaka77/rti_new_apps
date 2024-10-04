import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/models/user_model.dart';
import 'package:rti_new_apps/services/home_services.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomeServices services = Get.find(tag: 'homeServices');
  var isDepartment = true.obs;
  var isLocalCouncil = false.obs;
  final key = GlobalKey<ExpandableFabState>();
  var user = <UserModel>{}.obs;
  var isMeLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    me();
    super.onInit();
  }

  void me() async {
    isMeLoading.value = true;
    user.clear();
    try {
      var response = await services.me();
      user.add(response);
      isMeLoading.value = false;
    } catch (ex) {
      print(ex);
    }
  }
}
