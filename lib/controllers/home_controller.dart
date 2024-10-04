import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/models/faq_model.dart';
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
  var isFaqLoading = false.obs;
  var faqList = <FaqModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    me();
    getFaq();
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

  void getFaq() async {
    isFaqLoading.value = true;
    faqList.clear();
    try {
      var response = await services.getFaq();
      faqList.addAll(response);
      isFaqLoading.value = false;
    } catch (ex) {
      isFaqLoading.value = false;
    }
  }
}
