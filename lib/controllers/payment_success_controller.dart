import 'package:get/get.dart';
import 'package:rti_new_apps/services/payment_success_services.dart';

class PaymentSuccessController extends GetxController {
  PaymentSuccessServices services = Get.find(tag: 'paymentSuccessServices');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    verifyPayment('receipt', 'signature', 'orderId', 'paymentId');
  }

  Future verifyPayment(String receipt, String signature, String orderId,
      String paymentId) async {
    try {
      print('Hello');
      // var data =
      //     await services.verifyPayment(receipt, signature, orderId, paymentId);
      // if (data.statusCode == 200) {
      //   print('Success');
      // }
    } catch (ex) {}
  }
}
