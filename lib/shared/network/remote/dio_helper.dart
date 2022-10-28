import 'package:dio/dio.dart';
import 'package:flutter_payment/shared/network/api_const.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    dio.options.headers = {
      ApiConst.contentType: ApiConst.applicationJson,
    };
    return await dio.post(url, data: data, queryParameters: query);
  }
}
