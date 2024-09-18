import 'package:get/get.dart';
import 'package:rti_new_apps/middlewares/auth_middleware.dart';
import 'package:rti_new_apps/screens/home_screen.dart';
import 'package:rti_new_apps/screens/login_screen.dart';

pageTransition() {
  return Transition.upToDown;
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
  )
];
