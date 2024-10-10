import 'package:get/get.dart';
import 'package:rti_new_apps/middlewares/auth_middleware.dart';
import 'package:rti_new_apps/screens/change_password_screen.dart';
import 'package:rti_new_apps/screens/complain_detail_screen.dart';
import 'package:rti_new_apps/screens/forgot_password_otp_screen.dart';
import 'package:rti_new_apps/screens/home_screen.dart';
import 'package:rti_new_apps/screens/login_screen.dart';
import 'package:rti_new_apps/screens/my_profile_screen.dart';
import 'package:rti_new_apps/screens/nav_bar_screen.dart';
import 'package:rti_new_apps/screens/otp_screen.dart';
import 'package:rti_new_apps/screens/payment_success_screen.dart';
import 'package:rti_new_apps/screens/profile_screen.dart';
import 'package:rti_new_apps/screens/register_screen.dart';
import 'package:rti_new_apps/screens/rti_detail_screen.dart';
import 'package:rti_new_apps/screens/submit_complaint_screen.dart';
import 'package:rti_new_apps/screens/submit_rti_screen.dart';
import 'package:rti_new_apps/screens/verify_otp_screen.dart';

pageTransition() {
  return Transition.downToUp;
}

final getPages = [
  GetPage(
      name: '/',
      page: () => const NavBarScreen(),
      transition: pageTransition(),
      middlewares: [
        AuthMiddleware(),
      ],
      children: [
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
          transition: pageTransition(),
          middlewares: [
            AuthMiddleware(),
          ],
        ),
        GetPage(
          name: '/submit-rti-screen',
          page: () => const SubmitRtiScreen(),
          middlewares: [
            AuthMiddleware(),
          ],
          maintainState: true,
          transition: pageTransition(),
        ),
        GetPage(
          name: '/rti-detail-screen',
          page: () => const RtiDetailScreen(),
          middlewares: [
            AuthMiddleware(),
          ],
          maintainState: true,
          transition: pageTransition(),
        ),
        GetPage(
          name: '/profile-screen/:user',
          page: () => const ProfileScreen(),
          middlewares: [
            AuthMiddleware(),
          ],
          transition: pageTransition(),
        ),
        GetPage(
          name: '/submit-complaint',
          page: () => const SubmitComplaintScreen(),
          middlewares: [
            AuthMiddleware(),
          ],
          transition: pageTransition(),
        ),
        GetPage(
          name: '/complaint-detail-screen',
          page: () => const ComplainDetailScreen(),
          middlewares: [
            AuthMiddleware(),
          ],
          transition: pageTransition(),
        ),
        GetPage(
          name: '/my-profile-screen',
          page: () => const MyProfileScreen(),
          middlewares: [
            AuthMiddleware(),
          ],
          transition: pageTransition(),
        ),
        GetPage(
          name: '/payment-success-screen',
          page: () => const PaymentSuccessScreen(),
          middlewares: [
            AuthMiddleware(),
          ],
          transition: pageTransition(),
        ),
      ]),
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
    name: '/forgot-password-otp-screen',
    page: () => const ForgotPasswordOtpScreen(),
    transition: pageTransition(),
  ),
  GetPage(
    name: '/change-password-screen/:phone',
    page: () => const ChangePasswordScreen(),
    transition: pageTransition(),
  ),
];
