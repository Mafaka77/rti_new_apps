import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/main.dart';
import 'package:rti_new_apps/models/user_model.dart';
import 'package:rti_new_apps/services/profile_services.dart';

class ProfileController extends GetxController {
  ProfileServices services = Get.find(tag: 'profileServices');
  var isMeLoading = false.obs;
  var user = <UserModel>{}.obs;
  var nameText = TextEditingController();
  var mobileText = TextEditingController();
  var emailText = TextEditingController();
  var oldPasswordText = TextEditingController();
  var passwordText = TextEditingController();
  var isPasswordHidden = true.obs;
  var isOldPasswordHidden = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    me();
  }

  void me() async {
    isMeLoading.value = true;
    user.clear();
    try {
      var response = await services.me();
      nameText.text = response.name!;
      emailText.text = response.email!;
      mobileText.text = response.contact!;
      user.add(response);
      isMeLoading.value = false;
    } catch (ex) {
      print(ex);
    }
  }

  void deleteAccount(
      Function onLoading, Function onSuccess, Function onError) async {}
  void logout(Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.logout();
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess();
        } else {
          onError();
        }
      }
    } catch (ex) {
      onError();
    }
  }
}
