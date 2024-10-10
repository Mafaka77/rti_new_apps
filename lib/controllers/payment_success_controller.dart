import 'package:get/get.dart';

class PaymentSuccessController extends GetxController {
  var receipt = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    verifyPayment();
  }

  Future verifyPayment() async {
    try {
      print('receipt.value');
      //  var data = await services.verifyOrder(receipt.value, response.signature!,
      //   response.orderId!, response.paymentId!);
    } catch (ex) {}
  }
}
