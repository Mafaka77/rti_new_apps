import 'package:rti_new_apps/models/user_model.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class ProfileServices extends BaseService {
  Future<UserModel> me() async {
    try {
      var response = await client.get(Routes.ME);
      return UserModel.fromMap(response.data['user']);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future logout() async {
    try {
      var response = await client.get(Routes.LOGOUT);
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
