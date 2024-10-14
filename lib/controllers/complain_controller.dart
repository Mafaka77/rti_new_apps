import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rti_new_apps/models/complaint_detail_model.dart';
import 'package:rti_new_apps/models/complaint_model.dart';
import 'package:rti_new_apps/services/complaint_services.dart';

class ComplainController extends GetxController {
  ComplaintServices services = Get.find(tag: 'complaintServices');
  RefreshController refreshController = RefreshController();
  var complaintList = <ComplaintModel>[].obs;
  var complaintDetail = <ComplaintDetailModel>{}.obs;
  var isLoading = false.obs;
  var downloadPercentage = 0.obs;
  var offset = 0.obs;
  var limit = 10.obs;
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
      var response = await services.getMyComplaint(offset.value, limit.value);
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

  void onRefresh() async {
    offset.value = 0;
    limit.value = 10;
    complaintList.clear();
    var response = await services.getMyComplaint(offset.value, limit.value);
    complaintList.addAll(response);
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    offset.value = complaintList.length;
    var response = await services.getMyComplaint(offset.value, limit.value);
    complaintList.addAll(response);
    refreshController.loadComplete();
  }
}
