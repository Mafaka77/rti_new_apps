class Routes {
  static String BASE_URL = 'https://rti.mizoram.gov.in/api';
  // static String BASE_URL = 'https://staging.egovmz.in/api';
  static String DOWNLOAD_URL(String fileName) =>
      'https://rti.mizoram.gov.in/storage/files/$fileName';
  // static String RAZORPAY_KEY = 'rzp_test_pYMxUu0tLMBSbz';
  static String RAZORPAY_KEY = 'rzp_live_RzDxBnKyypP12K';

//   RAZORPAY_KEY_ID=rzp_live_RzDxBnKyypP12K
//  RAZORPAY_KEY_SECRET=bBE5mWzWBHn4FoqjrwukrAtp
  //AUTH
  static String SEND_OTP = '$BASE_URL/otp';
  static String VERIFY_OTP = '$BASE_URL/verify-otp';
  static String REGISTER = '$BASE_URL/register';
  static String LOGIN = '$BASE_URL/login';
  static String LOGOUT = '$BASE_URL/logout';
  //HOME
  static String ME = '$BASE_URL/me';
  //RTI
  static String GET_DEPARTMENT = '$BASE_URL/getAllDepartment';
  static String SUBMIT_FREE_RTI = '$BASE_URL/store-rti';
  static String GET_MY_RTI = '$BASE_URL/get-my-rti';
  static String GET_RTI_DETAILS = '$BASE_URL/get-my-rti-details';
  static String SUBMIT_FIRST_APPEAL = '$BASE_URL/first-appeal-rti';
  static String SUBMIT_SECOND_APPEAL = '$BASE_URL/second-appeal-rti';
  static String CREATE_ORDER = '$BASE_URL/create-order';
  static String VERIFY_ORDER = '$BASE_URL/verify-order';

  static String CREATE_ATTACHMENT_ORDER = '$BASE_URL/create-order-attachment';
  static String VERIFY_ATTACHMENT_PAYMENT = '$BASE_URL/verify-order-attachment';
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
  static String RESET_PASSWORD = '$BASE_URL/reset-password';

  //PAYMENT HISTORY
  static String GET_MOBILE_PAYMENT = '$BASE_URL/payment-history-mobile';
  static String GET_WEB_PAYMENT = '$BASE_URL/payment-history-web';
}
