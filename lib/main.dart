import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rti_new_apps/router.dart';
import 'package:rti_new_apps/screens/home_screen.dart';
import 'package:rti_new_apps/services/auth_services.dart';
import 'package:rti_new_apps/services/home_services.dart';

void main() async {
  await GetStorage.init();
  Get.put(AuthServices(), tag: 'authServices');
  Get.put(HomeServices(), tag: 'homeServices');
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: getPages,
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);
    return baseTheme.copyWith(
      scaffoldBackgroundColor: const Color(0xffEDEDFF),
      textTheme: GoogleFonts.robotoMonoTextTheme(baseTheme.textTheme),
    );
  }
}
