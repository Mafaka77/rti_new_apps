import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/models/district_model.dart';
import 'package:rti_new_apps/services/local_council_wise_services.dart';

class LocalCouncilWiseController extends GetxController {
  LocalCouncilWiseServices services = Get.find(tag: 'localCouncilWiseServices');
  var formKey = GlobalKey<FormState>();
  var attachmentName = TextEditingController();
  var attachment = XFile('');
  var isAttachment = false.obs;
  var isBpl = false.obs;
  var localCouncilId = 0.obs;
  var districtId = 0.obs;
  var question = TextEditingController();
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
  }

  Future getDistrict(String value) async {
    try {
      var response = await services.getDistrict();
      return response;
    } catch (ex) {
      print(ex);
    }
  }

  Future getLocalCouncil(String value) async {
    try {
      var response = await services.getLocalCoucil(value, districtId.value);
      return response;
    } catch (ex) {}
  }

  void submitFreeRti(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.submitFreeRti(
          localCouncilId.value,
          question.text,
          isBpl.value,
          isLibertyChecked.value,
          attachment,
          bplAttachment);
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 404) {
          onError(response.data['message']);
        }
      } else {
        onError('Something went wrong');
      }
    } catch (ex) {
      onError('Something went wrong');
    }
  }
}
