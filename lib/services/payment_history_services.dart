import 'package:rti_new_apps/models/mobile_payment_model.dart';
import 'package:rti_new_apps/models/web_payment_model.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class PaymentHistoryServices extends BaseService {
  Future<List<MobilePaymentModel>> getMobilePayment(
      int offset, int limit) async {
    try {
      var response =
          await client.get(Routes.GET_MOBILE_PAYMENT, queryParameters: {
        'offset': offset,
        'limit': limit,
      });
      var data = response.data['payments'];
      print(data);
      return MobilePaymentModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<List<WebPaymentModel>> getWebPayment(int offset, int limit) async {
    try {
      var response = await client.get(Routes.GET_WEB_PAYMENT, queryParameters: {
        'offset': offset,
        'limit': limit,
      });
      var data = response.data['payments'];
      print(data);
      return WebPaymentModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
