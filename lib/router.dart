import 'package:get/get.dart';
import 'package:rti_new_apps/middlewares/auth_middleware.dart';
import 'package:rti_new_apps/screens/home_screen.dart';
import 'package:rti_new_apps/screens/login_screen.dart';
import 'package:rti_new_apps/screens/otp_screen.dart';
import 'package:rti_new_apps/screens/register_screen.dart';
import 'package:rti_new_apps/screens/submit_rti_screen.dart';
import 'package:rti_new_apps/screens/verify_otp_screen.dart';

pageTransition() {
  return Transition.downToUp;
}

final getPages = [
  GetPage(
    name: '/',
    page: () => const HomeScreen(),
    transition: pageTransition(),
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: '/login-screen',
    page: () => const LoginScreen(),
    transition: pageTransition(),
  ),
  GetPage(
    name: '/otp-screen',
    page: () => const OtpScreen(),
    transition: pageTransition(),
  ),
  GetPage(
    name: '/verify-otp-screen',
    page: () => VerifyOtpScreen(),
    transition: pageTransition(),
  ),
  GetPage(
    name: '/register-screen',
    page: () => RegisterScreen(),
    transition: pageTransition(),
  ),
  GetPage(
    name: '/submit-rti-screen',
    page: () => const SubmitRtiScreen(),
  )
];
