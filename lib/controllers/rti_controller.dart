import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rti_new_apps/models/my_rti_details_model.dart';
import 'package:rti_new_apps/models/my_rti_model.dart';
import 'package:rti_new_apps/screens/payment_error_screen.dart';
import 'package:rti_new_apps/services/routes.dart';
import 'package:rti_new_apps/services/rti_services.dart';

class RtiController extends GetxController {
  RtiServices services = Get.find(tag: 'rtiServices');
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  var isRtiLoading = false.obs;
  var myRtiList = <MyRtiModel>[].obs;
  var myRtiDetails = <MyRtiDetailsModel>{}.obs;
  var downloadPercentage = 0.obs;

  //RTI DETAILS QUESTIONS
  final questionTileController = ExpansionTileController();
  final spioAnswerTileController = ExpansionTileController();
  final firstAppealTileController = ExpansionTileController();
  final firstAppealAnswerTileController = ExpansionTileController();
  final secondAppealTileController = ExpansionTileController();
  final secondAppealAnswerTileController = ExpansionTileController();
  //FIRST APPEAL
  final formKey = GlobalKey<FormState>();
  XFile? firstAppealAttachment = XFile('');
  var firstAttachmentName = TextEditingController();
  var isFirstAttachmentSelected = false.obs;
  var firstAppealReason = TextEditingController();

  //SECOND APPEAL ANSWER
  final secondAppealFormKey = GlobalKey<FormState>();
  XFile? secondAppealAttachment = XFile('');
  var secondAttachmentName = TextEditingController();
  var isSecondAttachmentSelected = false.obs;
  var secondAppealReason = TextEditingController();
  //RAZORPAY
  late Razorpay _razorpay;
  var receipt = ''.obs;
  var amount = ''.obs;
  var infoId = 0.obs;
  var isPaymentVerifyLoading = false.obs;
  var isPaymentSuccess = false.obs;
  var receipt_id = ''.obs;
  var order_id = ''.obs;
  var payment_id = ''.obs;
  var transactionDate = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getMyRti();
    super.onInit();
    _razorpay = Razorpay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void getMyRti() async {
    isRtiLoading.value = true;
    myRtiList.clear();
    try {
      var response = await services.getMyRti();
      myRtiList.addAll(response);
      isRtiLoading.value = false;
    } catch (ex) {}
  }

  void getRtiDetails(
      int id, Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    myRtiDetails.clear();
    try {
      var response = await services.getRtiDetails(id);
      myRtiDetails.add(response);
      onSuccess();
    } catch (ex) {
      onError();
    }
  }

  void submitFirstAppeal(int rtiId, Function onLoading, Function onSuccess,
      Function onError) async {
    onLoading();
    try {
      var response = await services.submitFirstAppeal(
          rtiId, firstAppealReason.text, firstAppealAttachment!);
      print(response.data);
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 404) {
          onError(response.data['reason']);
        }
      } else {
        onError('Something went wrong');
      }
    } catch (ex) {
      print(ex);
      onError('Something went wrong');
    }
  }

  void submitSecondAppeal(int rtiId, Function onLoading, Function onSuccess,
      Function onError) async {
    onLoading();
    try {
      var response = await services.submitSecondAppeal(
          rtiId, secondAppealReason.text, secondAppealAttachment!);
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        } else if (response.data['status'] == 404) {
          onError(response.data['message']);
        }
      } else {
        onError('Something went wrong');
      }
    } catch (ex) {
      onError('Something went wrong');
    }
  }

  void createOrder(int id, Function onLoading, Function onSuccess,
      Function onError, Function onPaymentError) async {
    onLoading();
    try {
      var response = await services.createOrder(id);
      if (response.statusCode == 200) {
        onSuccess();
        var data = response.data;
        infoId.value = id;
        receipt.value = data['receipt'];
        amount.value = data['amount'];
        print(data['amount'] + 'Pawisa');
        openCheckout(
          amount: data['amount'],
          name: data['name'],
          description: '',
          contact: data['contact'],
          email: data['email'],
          orderId: data['order_id'],
        );
      }
    } catch (ex) {
      onError('Something went wrong');
      print(ex);
    }
  }

  void openCheckout({
    required String amount,
    required String name,
    required String description,
    required String contact,
    required String email,
    required String orderId,
  }) {
    var options = {
      'key': Routes.RAZORPAY_KEY, // Replace with your Razorpay API key
      'amount': int.parse(amount) * 100, // Convert amount to paisa
      'name': name,
      'description': description,
      'prefill': {'contact': contact, 'email': email},
      'order_id': orderId,
      'timeout': "60"
    };

    try {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      _razorpay.open(options);
    } catch (e) {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(myErrorSnackBar('Error', "$e"));
      print("Error opening Razorpay: $e");
    }
  }

  // Handle payment success
  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    var parameters = <String, String>{
      "id": infoId.value.toString(),
      "orderId": response.orderId!,
      "paymentId": response.paymentId!,
      "signature": response.signature!,
      "receipt": receipt.value,
    };

    // var data = await services.verifyOrder(receipt.value, response.signature!,
    //     response.orderId!, response.paymentId!);
    // if (data.statusCode == 200) {
    Get.offAndToNamed('/attachment-payment-success-screen',
        parameters: parameters);
    // }
  }

  // Handle payment error
  void _handlePaymentError(
      PaymentFailureResponse response, BuildContext context) {
    Get.to(() => const PaymentErrorScreen());
  }

  // Handle external wallet payment
  void _handleExternalWallet(ExternalWalletResponse response) {}

  Future verifyPayment(String receipt, String signature, String orderId,
      String paymentId) async {
    isPaymentVerifyLoading.value = true;
    try {
      var response = await services.verifyOrder(
        receipt,
        signature,
        orderId,
        paymentId,
        amount.value,
      );

      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          isPaymentVerifyLoading.value = false;
          isPaymentSuccess.value = true;
          receipt_id.value = response.data['data']['receipt'];
          order_id.value = response.data['data']['order_id'];
          payment_id.value = response.data['data']['payment_id'];
          transactionDate.value = response.data['data']['transaction_time'];
        } else if (response.data['status'] == 400) {
          print(response.data);
          isPaymentVerifyLoading.value = false;
          isPaymentSuccess.value = false;
        }
      }
    } catch (ex) {
      isPaymentVerifyLoading.value = false;
      isPaymentSuccess.value = false;
    }
  }

  void onRefresh() async {
    myRtiList.clear();
    var response = await services.getMyRti();
    myRtiList.addAll(response);
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    refreshController.loadComplete();
  }
}
