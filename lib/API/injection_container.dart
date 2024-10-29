import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_api_intrgration/API/utils/print_value.dart';

Dio getDio() {
// // base options
//   BaseOptions baseOption = BaseOptions(
//       receiveDataWhenStatusError: true,
//       contentType: "application/json",
//       sendTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 30));

//   Dio dio = Dio(baseOption);
  Dio dio = Dio();

  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions option, handler) {
    printValue(tag: 'API URL', '${option.uri}');
    printValue(tag: 'Header', option.headers);
    printValue(tag: 'REQUEST BODY: ', jsonEncode(option.data));
    // option.headers = option.copyWith(headers:{"": "eou54"}).headers;
    return handler.next(option);
  }, onResponse: (Response response, ResponseInterceptorHandler handler) {
    printValue(tag: 'API Response', response.data);
    return handler.next(response);
  }, onError: (DioException e, handler) {
    printValue(tag: 'Status Code: ', "${e.response?.statusCode ?? ""}");
    printValue(tag: 'ErrorData :', e.response?.data ?? "");
    if (e.response?.statusCode == 401) {
      //navigate to login screen
    } else if (e.response?.statusCode == 400) {
      //toast
    }
    return handler.next(e);
  }));
  return dio;
}
