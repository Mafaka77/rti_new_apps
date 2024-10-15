import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rti_new_apps/models/mobile_payment_model.dart';
import 'package:rti_new_apps/services/payment_history_services.dart';

class MobileHistoryController extends GetxController {
  RefreshController refreshController = RefreshController();
  var isLoading = false.obs;
  PaymentHistoryServices services = Get.find(tag: 'paymentHistoryServices');
  var mobilePayments = <MobilePaymentModel>[].obs;

  var offset = 0.obs;
  var limit = 10.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMobilePayment();
  }

  void getMobilePayment() async {
    isLoading.value = true;
    mobilePayments.clear();
    try {
      var response = await services.getMobilePayment(
        offset.value,
        limit.value,
      );
      mobilePayments.addAll(response);
      isLoading.value = false;
    } catch (ex) {
      isLoading.value = false;
    }
  }

  void onRefresh() async {
    offset.value = 0;
    limit.value = 10;
    mobilePayments.clear();
    var response = await services.getMobilePayment(offset.value, limit.value);
    mobilePayments.addAll(response);
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    offset.value += limit.value;
    var response = await services.getMobilePayment(offset.value, limit.value);
    mobilePayments.addAll(response);
    refreshController.loadComplete();
  }
}
