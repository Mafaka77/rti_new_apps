import 'package:get/get.dart';
import 'package:rti_new_apps/services/payment_history_services.dart';

class PaymentHistoryController extends GetxController {
  var isLoading = false.obs;
  PaymentHistoryServices services = Get.find(tag: 'paymentHistoryServices');
  var mobilePayments = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getMobilePayment() async {
    isLoading.value = true;
    mobilePayments.clear();
    try {
      var response = await services.getMobilePayment();
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          var data = response.data['mobilePayments'];
          mobilePayments.addAll(data);
        }
      }
    } catch (ex) {}
  }
}
