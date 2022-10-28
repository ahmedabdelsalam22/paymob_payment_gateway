class ApiConst {
  static const String baseUrl = 'https://accept.paymob.com/api/';
  static String payMobApiKey =
      "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SndjbTltYVd4bFgzQnJJam8xT1RVM01qQXNJbTVoYldVaU9pSnBibWwwYVdGc0lpd2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkudVZrdVVRcE5lQ0s1MG9VUTdtalJocTRzMldoRVQyQVpHVFVoQ0lNX013RWh1RERVRDRqcENVcHBaeEQ5TFF2T0R6ZXFtMVhVcjVDc1ExanZMTXFrYWc=";
  static String payMobToken = '';
  static String payMobOrderId = '';
  static String finalTokenCard = '';
  static String finalTokenKiosk = '';
  static String integrationIdCard = '3001823';
  static String integrationIdKiosk = '3002427';
  static String refCode = '';
  static String webViewInitialUrl =
      "https://accept.paymob.com/api/acceptance/iframes/692203?payment_token=$finalTokenCard";
  static String contentType = 'Content-Type';
  static String applicationJson = 'application/json';

  // end points

  static String authToken = 'auth/tokens';
  static String apiKey = 'api_key';
  static String token = 'token';
  static String ecommerceOrders = 'ecommerce/orders';
  static String id = 'id';
  static String acceptancePaymentKeys = 'acceptance/payment_keys';
  static String acceptancePaymentPay = 'acceptance/payments/pay';
}
