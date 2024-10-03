import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/models/my_rti_details_model.dart';
import 'package:rti_new_apps/models/my_rti_model.dart';
import 'package:rti_new_apps/services/rti_services.dart';

class RtiController extends GetxController {
  RtiServices services = Get.find(tag: 'rtiServices');
  var isDepartment = true.obs;
  var isLocalCouncil = false.obs;
  var isRtiLoading = false.obs;
  var myRtiList = <MyRtiModel>[].obs;
  var myRtiDetails = <MyRtiDetailsModel>{}.obs;
  var downloadPercentage = 0.obs;

  //RTI DETAILS QUESTIONS
  final questionTileController = ExpansionTileController();
  final spioAnswerTileController = ExpansionTileController();
  final firstAppealTileController = ExpansionTileController();
  final firstAppealAnswerTileController = ExpansionTileController();
  final secondAppealTileController = ExpansionTileController();
  final secondAppealAnswerTileController = ExpansionTileController();
  //FIRST APPEAL
  final formKey = GlobalKey<FormState>();
  XFile? firstAppealAttachment = XFile('');
  var firstAttachmentName = TextEditingController();
  var isFirstAttachmentSelected = false.obs;
  var firstAppealReason = TextEditingController();

  //SECOND APPEAL ANSWER
  final secondAppealFormKey = GlobalKey<FormState>();
  XFile? secondAppealAttachment = XFile('');
  var secondAttachmentName = TextEditingController();
  var isSecondAttachmentSelected = false.obs;
  var secondAppealReason = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    getMyRti();
    super.onInit();
  }

  void getMyRti() async {
    isRtiLoading.value = true;
    myRtiList.clear();
    try {
      var response = await services.getMyRti();
      myRtiList.addAll(response);
      isRtiLoading.value = false;
    } catch (ex) {}
  }

  void getRtiDetails(
      int id, Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    myRtiDetails.clear();
    try {
      var response = await services.getRtiDetails(id);
      myRtiDetails.add(response);
      onSuccess();
    } catch (ex) {
      onError();
    }
  }

  void submitFirstAppeal(int rtiId, Function onLoading, Function onSuccess,
      Function onError) async {
    onLoading();
    try {
      var response = await services.submitFirstAppeal(
          rtiId, firstAppealReason.text, firstAppealAttachment!);
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

  void submitSecondAppeal(int rtiId, Function onLoading, Function onSuccess,
      Function onError) async {
    onLoading();
    try {
      var response = await services.submitSecondAppeal(
          rtiId, secondAppealReason.text, secondAppealAttachment!);
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
