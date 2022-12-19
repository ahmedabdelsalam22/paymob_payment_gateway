class ApiConst {
  static const String baseUrl = 'https://accept.paymob.com/api/';
  static String payMobApiKey =
      ""; // i hide payMobApiKey because is belong to me .. i save it in my veraCrypt files in my pc
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
