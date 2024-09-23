class Routes {
  static String BASE_URL = 'https://staging.egovmz.in/api';
  //AUTH
  static String SEND_OTP = '$BASE_URL/otp';
  static String VERIFY_OTP = '$BASE_URL/verify-otp';
  static String REGISTER = '$BASE_URL/register';
  static String LOGIN = '$BASE_URL/login';
  //HOME
  static String ME = '$BASE_URL/me';
  //RTI
  static String GET_DEPARTMENT = '$BASE_URL/getAllDepartment';
}
