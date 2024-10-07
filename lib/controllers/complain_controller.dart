import 'package:get/get.dart';
import 'package:rti_new_apps/models/complaint_detail_model.dart';
import 'package:rti_new_apps/models/complaint_model.dart';
import 'package:rti_new_apps/services/complaint_services.dart';

class ComplainController extends GetxController {
  ComplaintServices services = Get.find(tag: 'complaintServices');
  var complaintList = <ComplaintModel>[].obs;
  var complaintDetail = <ComplaintDetailModel>{}.obs;
  var isLoading = false.obs;
  var downloadPercentage = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyComplaint();
  }

  void getMyComplaint() async {
    isLoading.value = true;
    complaintList.clear();
    try {
      var response = await services.getMyComplaint();
      complaintList.addAll(response);
      isLoading.value = false;
    } catch (ex) {
      isLoading.value = false;
    }
  }

  void getComplaintDetail(
      int id, Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    complaintDetail.clear();
    try {
      var response = await services.getMyComplaintDetail(id);
      complaintDetail.add(response);

      onSuccess();
    } catch (ex) {
      print(ex);
      onError();
    }
  }
}
