import 'package:get/get.dart';
import 'package:rti_new_apps/models/user_model.dart';
import 'package:rti_new_apps/services/profile_services.dart';

class ProfileController extends GetxController {
  ProfileServices services = Get.find(tag: 'profileServices');
  var isMeLoading = false.obs;
  var user = <UserModel>{}.obs;
  @override
  void onInit() {
    // TODO: implement onInit
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
