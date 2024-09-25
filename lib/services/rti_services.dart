import 'package:rti_new_apps/models/my_rti_model.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class RtiServices extends BaseService {
  Future<List<MyRtiModel>> getMyRti() async {
    try {
      var response = await client.get(Routes.GET_MY_RTI);
      var data = response.data['informations'];
      return MyRtiModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
