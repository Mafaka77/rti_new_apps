import 'package:rti_new_apps/models/my_rti_details_model.dart';
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

  Future<MyRtiDetailsModel> getRtiDetails(int id) async {
    try {
      var respone = await client.get(Routes.GET_RTI_DETAILS, data: {'id': id});
      var data = respone.data['information'];
      return MyRtiDetailsModel.fromMap(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
