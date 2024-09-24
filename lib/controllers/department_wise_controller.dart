import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/services/department_wise_services.dart';

class DepartmentWiseController extends GetxController {
  DepartmentWiseServices services = Get.find(tag: 'departmentWiseServices');
  final formKey = GlobalKey<FormState>();
  var isBpl = false.obs;
  var isLiberty = false.obs;
  var isLibertyChecked = false.obs;
  var departmentId = 0.obs;
  var questionsText = TextEditingController();
  Future getDepartment(String filter) async {
    var response = await services.getDepartment(filter);
    return response;
  }
}
