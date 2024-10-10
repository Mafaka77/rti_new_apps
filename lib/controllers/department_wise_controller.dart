import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rti_new_apps/services/department_wise_services.dart';
import 'package:rti_new_apps/services/routes.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class DepartmentWiseController extends GetxController {
  DepartmentWiseServices services = Get.find(tag: 'departmentWiseServices');
  final formKey = GlobalKey<FormState>();
  var isBpl = false.obs;
  var isLiberty = false.obs;
  var isLibertyChecked = false.obs;
  var departmentId = 0.obs;
  var questionsText = TextEditingController();
  //Attachment
  XFile? attachment = XFile('');
  var attachmentName = TextEditingController();
  var isAttachment = false.obs;
  //BPL
  XFile? bplAttachment = XFile('');
  var bplAttachmentName = TextEditingController();
  var isBlpAttachment = false.obs;
  //RAZORPAY

  late Razorpay _razorpay;
  var receipt = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _razorpay = Razorpay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  //----------------------------------------------------
  Future getDepartment(String filter) async {
    var response = await services.getDepartment(filter);
    return response;
  }

  void submitFreeRti(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.submitFreeRti(
          departmentId.value,
          questionsText.text,
          isBlpAttachment.value,
          isLiberty.value,
          attachment!,
          bplAttachment!);

      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        }
      } else {
        onError('Something went wrong');
      }
    } catch (ex) {
      onError('Something went wrong');
    }
  }

  void createOrder(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.createOrder(
          questionsText.text, attachment, departmentId.value, isLiberty.value);
      if (response.statusCode == 200) {
        onSuccess();
        var data = response.data;
        receipt.value = data['receipt'];
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

  void openCheckout(
      {required String amount,
      required String name,
      required String description,
      required String contact,
      required String email,
      required String orderId}) {
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
      "orderId": response.orderId!,
      "paymentId": response.paymentId!,
      "signature": response.signature!,
      "receipt": receipt.value,
    };

    var data = await services.verifyOrder(receipt.value, response.signature!,
        response.orderId!, response.paymentId!);
    if (data.statusCode == 200) {
      Get.offAndToNamed('/payment-success-screen', parameters: parameters);
    }
  }

  // Handle payment error
  void _handlePaymentError(
      PaymentFailureResponse response, BuildContext context) {
    Get.rawSnackbar(title: 'Error', message: response.message);
  }

  // Handle external wallet payment
  void _handleExternalWallet(ExternalWalletResponse response) {}
}
