import 'package:flutter_api_intrgration/api_Integration/API/injection_container.dart';
import 'package:dio/dio.dart';

class DioHelper {
  Dio dio = getDio();

  Map<String, dynamic> headers = {"Authorization": 'Bearer token'};

  Future<Response?> get(
      {required String url, bool isAuthRequired = false}) async {
    Options options = Options();

    if (isAuthRequired) {
      //options.headers = headers;
    }

    try {
      Response response = await dio.get(url, options: options);
      return response; // Return the full Response object
    } catch (error) {
      print("Exception: $error");
      return null;
    }
  }

//post
  Future<Response?> post({
    required String url,
    Object? requestBody,
    bool isAuthRequired = false,
  }) async {
    Options options = Options();
    if (isAuthRequired) {
      // options.headers = headers;
    }

    try {
      Response response;
      if (requestBody == null) {
        response = await dio.post(url, options: options);
      } else {
        response = await dio.post(url, data: requestBody, options: options);
      }
      return response;
    } catch (e) {
      return null;
    }
  }

//put
  Future<Response?> put({
    required String url,
    Object? requestBody,
    bool isAuthRequired = false,
  }) async {
    Options options = Options();
    if (isAuthRequired) {
      //options.headers = headers;
    }

    try {
      Response response;
      if (requestBody == null) {
        response = await dio.put(url, options: options);
      } else {
        response = await dio.put(url, data: requestBody, options: options);
      }
      return response;
    } catch (e) {
      return null;
    }
  }

  //patch
  Future<Response?> patch({
    required String url,
    Object? requestBody,
    bool isAuthRequired = false,
  }) async {
    Options options = Options();
    if (isAuthRequired) {
      // options.headers = headers;
    }

    try {
      Response response;
      if (requestBody == null) {
        response = await dio.patch(url, options: options);
      } else {
        response = await dio.patch(url, data: requestBody, options: options);
      }
      return response;
    } catch (e) {
      return null;
    }
  }

  //delete
  Future<Response?> delete({
    required String url,
    Object? requestBody,
    bool isAuthRequired = false,
  }) async {
    Options options = Options();
    if (isAuthRequired) {
      // options.headers = headers;
    }

    try {
      Response response;
      if (requestBody == null) {
        response = await dio.patch(url, options: options);
      } else {
        response = await dio.patch(url, data: requestBody, options: options);
      }
      return response;
    } catch (e) {
      return null;
    }
  }
}
