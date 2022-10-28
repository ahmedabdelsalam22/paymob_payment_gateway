abstract class PaymentSates {}

class PaymentInitialState extends PaymentSates {}

class PaymentLoadingState extends PaymentSates {}

class PaymentSuccessState extends PaymentSates {}

class PaymentErrorState extends PaymentSates {
  String error;

  PaymentErrorState(this.error);
}

// order Id
class PaymentOrderIdLoadingState extends PaymentSates {}

class PaymentOrderIdSuccessState extends PaymentSates {}

class PaymentOrderIdErrorState extends PaymentSates {
  String error;

  PaymentOrderIdErrorState(this.error);
}

// RequestToken
class PaymentRequestTokenLoadingState extends PaymentSates {}

class PaymentRequestTokenSuccessState extends PaymentSates {}

class PaymentRequestTokenErrorState extends PaymentSates {
  String error;

  PaymentRequestTokenErrorState(this.error);
}

//RequestTokenKiosk
class PaymentRequestTokenKioskLoadingState extends PaymentSates {}

class PaymentRequestTokenKioskSuccessState extends PaymentSates {}

class PaymentRequestTokenKioskErrorState extends PaymentSates {
  String error;

  PaymentRequestTokenKioskErrorState(this.error);
}

//RefCodeKiosk
class PaymentRefCodeKioskLoadingState extends PaymentSates {}

class PaymentRefCodeKioskSuccessState extends PaymentSates {}

class PaymentRefCodeKioskErrorState extends PaymentSates {
  String error;

  PaymentRefCodeKioskErrorState(this.error);
}
