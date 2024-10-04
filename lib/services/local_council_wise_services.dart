import 'package:rti_new_apps/models/local_council_model.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class LocalCouncilWiseServices extends BaseService {
  Future getDistrict() async {
    try {
      var response = await client.get(Routes.GET_DISTRICT);
      var data = response.data['data'];

      return data;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<List<LocalCouncilModel>> getLocalCoucil(String value) async {
    var response = await client.get(
      Routes.GET_LOCAL_COUNCIL,
      data: {"district": "Aizawl"},
      queryParameters: {'filter': value},
    );
    var data = response.data['data'];
    if (data != null) {
      return LocalCouncilModel.fromJsonList(data);
    }
    return [];
  }
}
