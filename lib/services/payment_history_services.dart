import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class PaymentHistoryServices extends BaseService {
  Future getAllPayment() async {
    try {
      var response = await client.get(Routes.GET_ALL_PAYMENT_HISTORY);
    } catch (ex) {}
  }
}
