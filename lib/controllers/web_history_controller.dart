import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rti_new_apps/models/web_payment_model.dart';
import 'package:rti_new_apps/services/payment_history_services.dart';

class WebHistoryController extends GetxController {
  var isLoading = false.obs;
  PaymentHistoryServices services = Get.find(tag: 'paymentHistoryServices');
  RefreshController refreshController = RefreshController();
  var webPayments = <WebPaymentModel>[].obs;
  var offset = 0.obs;
  var limit = 10.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWebPayment();
  }

  void getWebPayment() async {
    isLoading.value = true;
    webPayments.clear();
    try {
      var response = await services.getWebPayment(offset.value, limit.value);
      webPayments.addAll(response);
      isLoading.value = false;
    } catch (ex) {
      isLoading.value = false;
    }
  }

  void onRefresh() async {
    offset.value = 0;
    limit.value = 10;
    webPayments.clear();
    var response = await services.getWebPayment(offset.value, limit.value);
    webPayments.addAll(response);
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    offset.value += limit.value;
    var response = await services.getWebPayment(offset.value, limit.value);
    webPayments.addAll(response);
    refreshController.loadComplete();
  }
}
