import 'package:get/get.dart';
import 'package:rti_new_apps/models/mobile_payment_model.dart';
import 'package:rti_new_apps/models/web_payment_model.dart';
import 'package:rti_new_apps/services/payment_history_services.dart';

class PaymentHistoryController extends GetxController {
  var isLoading = false.obs;
  PaymentHistoryServices services = Get.find(tag: 'paymentHistoryServices');
  var mobilePayments = <MobilePaymentModel>[].obs;
  var webPayments = <WebPaymentModel>[].obs;
  var mobileOffset = 0.obs;
  var mobileLimit = 10.obs;
  var isMobile = true.obs;
  var isWeb = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
