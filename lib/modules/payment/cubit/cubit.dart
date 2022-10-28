import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payment/modules/payment/cubit/states.dart';
import 'package:flutter_payment/shared/network/api_const.dart';
import 'package:flutter_payment/shared/network/remote/dio_helper.dart';

class PaymentCubit extends Cubit<PaymentSates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future getFirstToken({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    emit(PaymentLoadingState());
    DioHelper.postData(
      url: ApiConst.authToken,
      data: {
        ApiConst.apiKey: ApiConst.payMobApiKey,
      },
    ).then((value) {
      ApiConst.payMobToken = value.data[ApiConst.token];
      getOrderId(
        price: price,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );
      emit(PaymentSuccessState());
    }).catchError((onError) {
      emit(PaymentErrorState(onError.toString()));
    });
  }

  Future getOrderId({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    emit(PaymentOrderIdLoadingState());
    DioHelper.postData(
      url: ApiConst.ecommerceOrders,
      data: {
        "auth_token": ApiConst.payMobToken,
        'delivery_needed': 'false',
        'amount_cents': price,
        "currency": "EGP",
        'items': [],
      },
    ).then((value) {
      print('Order Id ${value.data[ApiConst.id].toString()}');
      ApiConst.payMobOrderId = value.data[ApiConst.id].toString();
      getFinalTokenCard(
        price: price,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );
      getFinalTokenKiosk(
        price: price,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );

      emit(PaymentOrderIdSuccessState());
    }).catchError((onError) {
      emit(PaymentOrderIdErrorState(onError.toString()));
    });
  }

  Future getFinalTokenCard({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    emit(PaymentRequestTokenLoadingState());
    DioHelper.postData(
      url: ApiConst.acceptancePaymentKeys,
      data: {
        "auth_token": ApiConst.payMobToken,
        'order_id': ApiConst.payMobOrderId,
        "expiration": 3600,
        'amount_cents': price,
        'integration_id': ApiConst.integrationIdCard,
        "currency": "EGP",
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
      },
    ).then((value) {
      ApiConst.finalTokenCard = value.data[ApiConst.token];
      emit(PaymentRequestTokenSuccessState());
    }).catchError((onError) {
      emit(PaymentRequestTokenErrorState(onError.toString()));
    });
  }

  Future getFinalTokenKiosk({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    emit(PaymentRequestTokenKioskLoadingState());
    DioHelper.postData(
      url: ApiConst.acceptancePaymentKeys,
      data: {
        "auth_token": ApiConst.payMobToken,
        'order_id': ApiConst.payMobOrderId,
        "expiration": 3600,
        'amount_cents': price,
        'integration_id': ApiConst.integrationIdKiosk,
        "currency": "EGP",
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
      },
    ).then((value) {
      ApiConst.finalTokenKiosk = value.data[ApiConst.token];
      getReferenceCode();
      emit(PaymentRequestTokenKioskSuccessState());
    }).catchError((onError) {
      emit(PaymentRequestTokenKioskErrorState(onError.toString()));
    });
  }

  Future getReferenceCode() async {
    emit(PaymentRefCodeKioskLoadingState());
    DioHelper.postData(
      url: ApiConst.acceptancePaymentPay,
      data: {
        "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
        "payment_token": ApiConst.finalTokenKiosk
      },
    ).then((value) {
      ApiConst.refCode = value.data[ApiConst.id].toString();
      emit(PaymentRefCodeKioskSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(PaymentRefCodeKioskErrorState(onError.toString()));
    });
  }
}
