import 'package:dio/dio.dart';

class DioInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Print request details
    print('Request URL: ${options.uri}');
    print('Request Type: ${options.method}');
    print('Request Headers: ${options.headers}');
    print('Request Body: ${options.data}');
    return super.onRequest(options, handler); // continue with the request
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    // Print response details
    print('Response Status Code: ${response.statusCode}');
    print('Response Data: ${response.data}');
    return super.onResponse(response, handler); // continue with the response
  }

  @override
  onError(DioError e, ErrorInterceptorHandler handler) {
    // Print error details
    print('Error: ${e.response?.statusCode}');
    print('Error Message: ${e.message}');
    return super.onError(e, handler); // continue with the error
  }
}
