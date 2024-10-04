import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/services/local_council_wise_services.dart';

class LocalCouncilWiseController extends GetxController {
  LocalCouncilWiseServices services = Get.find(tag: 'localCouncilWiseServices');
  var formKey = GlobalKey<FormState>();
  var districtList = <String>[].obs;
  var attachmentName = TextEditingController();
  var attachment = XFile('');
  var isAttachment = false.obs;
  var isBpl = false.obs;
  var localCouncilId = 0.obs;
//LIBERTY
  var isLiberty = false.obs;
  var isLibertyChecked = false.obs;
  //BPL
  var bplAttachmentName = TextEditingController();
  var bplAttachment = XFile('');
  var isBplAttachment = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDistrict();
  }

  void getDistrict() async {
    districtList.clear();
    try {
      var response = await services.getDistrict();
      var data = jsonEncode(response);

      districtList.add(data);
    } catch (ex) {
      print(ex);
    }
  }

  Future getLocalCouncil(String value) async {
    try {
      var response = await services.getLocalCoucil(value);
      return response;
    } catch (ex) {}
  }
}
