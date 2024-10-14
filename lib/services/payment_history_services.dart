import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class PaymentHistoryServices extends BaseService {
  Future getMobilePayment() async {
    try {
      var response = await client.get(Routes.GET_ALL_PAYMENT_HISTORY);
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }
}