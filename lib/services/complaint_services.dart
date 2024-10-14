import 'package:rti_new_apps/models/complaint_detail_model.dart';
import 'package:rti_new_apps/models/complaint_model.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class ComplaintServices extends BaseService {
  Future<List<ComplaintModel>> getMyComplaint(int offset, int limit) async {
    try {
      var response = await client.get(Routes.GET_MY_COMPLAINT, data: {
        'offset': offset,
        'limit': limit,
      });
      var data = response.data['complains'];
      return ComplaintModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<ComplaintDetailModel> getMyComplaintDetail(int id) async {
    try {
      var response = await client.get(
        Routes.GET_COMPLAINT_DETAIL,
        data: {'complain_id': id},
      );
      var data = response.data['complains'];
      return ComplaintDetailModel.fromMap(data);
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }
}
