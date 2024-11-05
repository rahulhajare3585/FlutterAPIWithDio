import 'package:dio/dio.dart';
import '../Network/error_interceptor.dart';

class DioApi {
  final dio = createDio();

  String _token = "";
  String _apiKey = "";

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "YOUR BASE URL HERE", //For example : https:www.example.com
      connectTimeout: Duration(microseconds: 300000),
      //30 secs
      receiveTimeout: Duration(microseconds: 300000),
      //30 secs
      sendTimeout: Duration(microseconds: 300000),
      //20secs
    ));
    dio.interceptors.addAll({ErrorInterceptor(dio)});
    return dio;
  }
}
