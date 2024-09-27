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
  static String SUBMIT_FREE_RTI = '$BASE_URL/store-rti';
  static String GET_MY_RTI = '$BASE_URL/get-my-rti';
  static String GET_RTI_DETAILS = '$BASE_URL/get-my-rti-details';
  static String SUBMIT_FIRST_APPEAL = '$BASE_URL/first-appeal-rti';
}
