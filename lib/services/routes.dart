class Routes {
  static String BASE_URL = 'https://staging.egovmz.in/api';
  static String DOWNLOAD_URL(String fileName) =>
      'https://staging.egovmz.in/storage/files/$fileName';
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
  static String SUBMIT_SECOND_APPEAL = '$BASE_URL/second-appeal-rti';

  //LOCAL COUNCIL
  static String GET_DISTRICT = '$BASE_URL/getDistrict';
  static String GET_LOCAL_COUNCIL = '$BASE_URL/getLocalCouncil';

  //FAQ
  static String GET_FAQ = '$BASE_URL/getFAQ';

  //STATS
  static String GET_STATS = '$BASE_URL/getStatistics';

  //COMPLAINT
  static String SUBMIT_COMPLAINT = '$BASE_URL/storeComplain';
  static String GET_MY_COMPLAINT = '$BASE_URL/get-my-complain';
  static String GET_COMPLAINT_DETAIL = '$BASE_URL/get-my-complain-details';

  //RESET PASSWORD
  static String RESET_PASSWORD_OTP = '$BASE_URL/password-reset-otp';
  static String RESET_PASSWORD_VERIFY_OTP = '$BASE_URL/verify-password-otp';
}
