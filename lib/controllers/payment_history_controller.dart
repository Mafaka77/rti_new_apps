import 'package:get/get.dart';
import 'package:rti_new_apps/services/payment_history_services.dart';

class PaymentHistoryController extends GetxController {
  var isLoading = false.obs;
  PaymentHistoryServices services = Get.find(tag: 'paymentHistoryServices');
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getAllPaymentHistory() async {
    isLoading.value = true;
    try {
      var response = await services.getAllPayment();
    } catch (ex) {}
  }
}
