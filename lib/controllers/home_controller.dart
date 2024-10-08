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
  var isStatsLoading = false.obs;
  var faqList = <FaqModel>[].obs;
  var statsDate = {}.obs;
  var statsData = {}.obs;
  var isPaymentSuccess = false.obs;
  var pdfList = [
    {
      'url': 'https://rti.mizoram.gov.in/images/rti.pdf',
      'icon': 'images/manual.png',
      'name': 'Manual',
      'file_name': 'rti.pdf'
    },
    {
      'url': 'https://rti.mizoram.gov.in/images/guidelines.pdf',
      'icon': 'images/file-2.png',
      'name': 'Guidlines',
      'file_name': 'guidelines.pdf'
    },
    {
      'url': 'https://rti.mizoram.gov.in/my/tc',
      'icon': 'images/terms-and-conditions.png',
      'name': 'Terms',
      'file_name': ''
    }
  ];
  var downloadPercentage = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    me();
    getFaq();
    getStats();
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

  void getStats() async {
    isStatsLoading.value = true;
    statsDate.clear();
    statsData.clear();
    try {
      var response = await services.getStats();
      statsDate.addAll(response['date']);
      statsData.addAll(response['data']);
      isStatsLoading.value = false;
    } catch (ex) {
      isStatsLoading.value = true;
    }
  }

  Future verifyPayment(String receipt, String signature, String orderId,
      String paymentId) async {
    try {
      var data =
          await services.verifyOrder(receipt, signature, orderId, paymentId);
      if (data.statusCode == 200) {
        isPaymentSuccess.value = true;
      }
    } catch (ex) {}
  }
}
