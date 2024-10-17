import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/screens/submit_complaint_screen.dart';
import 'package:rti_new_apps/services/submit_complaint_services.dart';

class SubmitComplaintController extends GetxController {
  SubmitComplaintServices services = Get.find(tag: 'submitComplaintServices');
  var form = GlobalKey<FormState>();
  var complaint = TextEditingController();
  var attachment = XFile('');
  var attachmentName = TextEditingController();
  var isAttachment = false.obs;

  void submitComplaint(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.submitComplaint(
        complaint.text,
        attachment,
        attachmentName.text,
      );
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 404) {
          onError(response.data['message']);
        }
      } else {
        onError('Something went wrong!');
      }
    } catch (ex) {
      print(ex);
      onError('Something went wrong!');
    }
  }
}
