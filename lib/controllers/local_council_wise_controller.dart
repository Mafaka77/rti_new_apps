import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rti_new_apps/models/district_model.dart';
import 'package:rti_new_apps/services/local_council_wise_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class LocalCouncilWiseController extends GetxController {
  LocalCouncilWiseServices services = Get.find(tag: 'localCouncilWiseServices');
  var formKey = GlobalKey<FormState>();
  var attachmentName = TextEditingController();
  var attachment = XFile('');
  var isAttachment = false.obs;
  var isBpl = false.obs;
  var localCouncilId = 0.obs;
  var districtId = 0.obs;
  var question = TextEditingController();
//LIBERTY
  var isLiberty = false.obs;
  var isLibertyChecked = false.obs;
  //BPL
  var bplAttachmentName = TextEditingController();
  var bplAttachment = XFile('');
  var isBplAttachment = false.obs;
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

  Future getDistrict(String value) async {
    try {
      var response = await services.getDistrict();
      return response;
    } catch (ex) {
      print(ex);
    }
  }

  Future getLocalCouncil(String value) async {
    try {
      var response = await services.getLocalCoucil(value, districtId.value);
      return response;
    } catch (ex) {}
  }

  void submitFreeRti(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.submitFreeRti(
          localCouncilId.value,
          question.text,
          isBpl.value,
          isLibertyChecked.value,
          attachment,
          bplAttachment);
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

  void createOrder(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.createOrder(
          question.text, attachment, localCouncilId.value, isLiberty.value);
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

    // var data = await services.verifyOrder(receipt.value, response.signature!,
    //     response.orderId!, response.paymentId!);
    // if (data.statusCode == 200) {
    Get.offAndToNamed('/payment-success-screen', parameters: parameters);
    // }
  }

  // Handle payment error
  void _handlePaymentError(
      PaymentFailureResponse response, BuildContext context) {
    Get.rawSnackbar(title: 'Error', message: response.message);
  }

  // Handle external wallet payment
  void _handleExternalWallet(ExternalWalletResponse response) {}
}
