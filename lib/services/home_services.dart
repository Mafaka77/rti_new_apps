import 'package:rti_new_apps/models/faq_model.dart';
import 'package:rti_new_apps/models/user_model.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class HomeServices extends BaseService {
  Future<UserModel> me() async {
    try {
      var response = await client.get(Routes.ME);
      return UserModel.fromMap(response.data['user']);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<List<FaqModel>> getFaq() async {
    try {
      var response = await client.get(Routes.GET_FAQ);
      var data = response.data['data'];
      return FaqModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future getStats() async {
    try {
      var response = await client.get(Routes.GET_STATS);
      return response.data;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future verifyOrder(String receipt, String signature, String orderId,
      String paymentId) async {
    try {
      var response = await client.post(Routes.VERIFY_ORDER, data: {
        'receipt': receipt,
        'razorpay_signature': signature,
        'razorpay_order_id': orderId,
        'razorpay_payment_id': paymentId,
      });
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }
}
