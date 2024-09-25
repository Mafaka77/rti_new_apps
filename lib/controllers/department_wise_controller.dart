import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/services/department_wise_services.dart';

class DepartmentWiseController extends GetxController {
  DepartmentWiseServices services = Get.find(tag: 'departmentWiseServices');
  final formKey = GlobalKey<FormState>();
  var isBpl = false.obs;
  var isLiberty = false.obs;
  var isLibertyChecked = false.obs;
  var departmentId = 0.obs;
  var questionsText = TextEditingController();
  //Attachment
  XFile? attachment = XFile('');
  var attachmentName = TextEditingController();
  var isAttachment = false.obs;
  //BPL
  XFile? bplAttachment = XFile('');
  var bplAttachmentName = TextEditingController();
  var isBlpAttachment = false.obs;

  //----------------------------------------------------
  Future getDepartment(String filter) async {
    var response = await services.getDepartment(filter);
    return response;
  }

  void submitFreeRti(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.submitFreeRti(
          departmentId.value,
          questionsText.text,
          isBlpAttachment.value,
          isLiberty.value,
          attachment!,
          bplAttachment!);

      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        }
      } else {
        onError('Something went wrong');
      }
    } catch (ex) {
      onError('Something went wrong');
    }
  }
}
