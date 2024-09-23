import 'package:rti_new_apps/models/department_model.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class DepartmentWiseServices extends BaseService {
  Future<List<DepartmentModel>> getDepartment(filter) async {
    var response = await client.get(
      Routes.GET_DEPARTMENT,
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return DepartmentModel.fromJsonList(data);
    }

    return [];
  }
}
