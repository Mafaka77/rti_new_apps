import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/main.dart';

class BaseService extends GetConnect implements GetxService {
  late Dio client;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    client = Dio();
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          var token = storage.read('token');
          if (token != null && token != '') {
            request.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(request);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await storage.remove('token');
            Get.offAllNamed('/login-screen');
          }
          handler.next(error);
        },
      ),
    );
  }
}
