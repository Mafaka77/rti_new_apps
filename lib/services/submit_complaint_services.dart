import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class SubmitComplaintServices extends BaseService {
  Future submitComplaint(
      String complaint, XFile attachment, String? attachmentName) async {
    FormData formData = FormData.fromMap({
      'my_file': attachment.path.isEmpty
          ? null
          : await MultipartFile.fromFile(attachment.path,
              filename: attachment.name),
      'question': complaint,
    });
    try {
      var response = await client.post(
        Routes.SUBMIT_COMPLAINT,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
