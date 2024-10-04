import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/router.dart';
import 'package:rti_new_apps/screens/home_screen.dart';
import 'package:rti_new_apps/services/auth_services.dart';
import 'package:rti_new_apps/services/department_wise_services.dart';
import 'package:rti_new_apps/services/home_services.dart';
import 'package:rti_new_apps/services/rti_services.dart';

final storage = GetStorage();
void main() async {
  await GetStorage.init();
  Get.put(AuthServices(), tag: 'authServices');
  Get.put(HomeServices(), tag: 'homeServices');
  Get.put(DepartmentWiseServices(), tag: 'departmentWiseServices');
  Get.put(RtiServices(), tag: 'rtiServices');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RTI Online',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      //   fontFamily: '',
      //   useMaterial3: true,
      // ),
      theme: _buildTheme(),
      initialRoute: '/nav',
      getPages: getPages,
    );
  }

  ThemeData _buildTheme() {
    var baseTheme = ThemeData();
    return baseTheme.copyWith(
      scaffoldBackgroundColor: MyColor.lightGreen,
      textTheme: GoogleFonts.robotoMonoTextTheme(baseTheme.textTheme),
    );
  }
}
