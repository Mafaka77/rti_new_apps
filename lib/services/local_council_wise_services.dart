import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rti_new_apps/models/district_model.dart';
import 'package:rti_new_apps/models/local_council_model.dart';
import 'package:rti_new_apps/services/base_services.dart';
import 'package:rti_new_apps/services/routes.dart';

class LocalCouncilWiseServices extends BaseService {
  Future<List<DistrictModel>> getDistrict() async {
    try {
      var response = await client.get(Routes.GET_DISTRICT);
      var data = response.data['data'];

      return DistrictModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<List<LocalCouncilModel>> getLocalCoucil(
      String value, int districtId) async {
    var response = await client.get(
      Routes.GET_LOCAL_COUNCIL,
      data: {"district": districtId},
      queryParameters: {'filter': value},
    );
    var data = response.data['data'];
    if (data != null) {
      return LocalCouncilModel.fromJsonList(data);
    }
    return [];
  }

  Future submitFreeRti(
    int localCouncilId,
    String question,
    bool bpl,
    bool life,
    XFile attachment,
    XFile bplAttachment,
  ) async {
    FormData formData = FormData.fromMap({
      'local_council': localCouncilId,
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

  Future createOrder(String question, XFile? attachment, int localCouncilId,
      bool lifeOrDeath) async {
    FormData formData = FormData.fromMap({
      'local_council': localCouncilId,
      'my_file': attachment!.path.isEmpty
          ? null
          : await MultipartFile.fromFile(attachment.path,
              filename: attachment.name),
      'question': question,
      'life_or_death': lifeOrDeath,
    });
    try {
      var response = await client.post(Routes.CREATE_ORDER, data: formData);
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
