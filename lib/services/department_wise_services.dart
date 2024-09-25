import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/models/department_model.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class DepartmentWiseServices extends BaseService {
  Future<List<DepartmentModel>> getDepartment(filter) async {
    var response = await client.get(
      Routes.GET_DEPARTMENT,
      queryParameters: {"filter": filter},
    );

    final data = response.data['data'];
    if (data != null) {
      return DepartmentModel.fromJsonList(data);
    }

    return [];
  }

  Future submitFreeRti(
    int departmentId,
    String question,
    bool bpl,
    bool life,
    XFile attachment,
    XFile bplAttachment,
  ) async {
    FormData formData = FormData.fromMap({
      'department': departmentId,
      'my_file': attachment.path.isEmpty
          ? null
          : await MultipartFile.fromFile(attachment.path,
              filename: attachment.name),
      'question': question,
      'bpl': bpl,
      'my_file_bpl': bplAttachment.path.isEmpty
          ? null
          : await MultipartFile.fromFile(bplAttachment.path,
              filename: bplAttachment.name),
      'life_or_death': life,
    });

    try {
      var response = await client.post(
        Routes.SUBMIT_FREE_RTI,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
      return response;
    } catch (ex) {
      print(ex);
      return Future.error;
    }
  }
}
