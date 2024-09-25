import 'package:get/get.dart';
import 'package:rti_new_apps/models/my_rti_model.dart';
import 'package:rti_new_apps/services/rti_services.dart';

class RtiController extends GetxController {
  RtiServices services = Get.find(tag: 'rtiServices');
  var isDepartment = true.obs;
  var isLocalCouncil = false.obs;
  var isRtiLoading = false.obs;
  var myRtiList = <MyRtiModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getMyRti();
    super.onInit();
  }

  void getMyRti() async {
    isRtiLoading.value = true;
    try {
      var response = await services.getMyRti();
      myRtiList.addAll(response);
      isRtiLoading.value = false;
    } catch (ex) {}
  }
}
