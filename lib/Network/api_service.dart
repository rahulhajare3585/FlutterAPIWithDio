import 'package:flutter_api_intrgration/model/login_model.dart';
import '../Network/config.dart';
import 'package:dio/dio.dart';
import '../model/tenant_request_model.dart';
import '../model/tenant_response_model.dart';
import '../model/login_response_model.dart';

class ApiService {
  final Config config = Config();
  final String baseUrl = Config().baseUrl;
  final Dio dio = Dio();

  // Define the headers without the tenant id initially
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Abp.TenantId': '4'
  };

  ///[Post]
  Future<TenantResponseModel> checkTenantAvailability(
      TenantRequestModel requestModel) async {
    try {
      Response response = await dio.post(
        '$baseUrl/api/services/app/Account/IsTenantAvailable',
        data: requestModel.toJson(),
        options: Options(headers: headers),
      );

      print(response.data);

      return TenantResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  ///[Post]
  Future<LoginRespModel> authenticateUser(
      LoginModel userdata, int? tenantId) async {
    headers['Abp.TenantId'] = tenantId.toString();

    print('Headers: $headers');
    print('URL: $baseUrl/api/TokenAuth/Authenticate');
    print('Request Body: ${userdata.toJson()}');

    try {
      Response response = await dio.post(
        '$baseUrl/api/TokenAuth/Authenticate',
        data: userdata.toJson(),
        options: Options(headers: headers),
      );

      // print('Response Status: ${response.statusCode}');
      print('Response Data: ${response.data}');

      return LoginRespModel.fromJson(response.data);
    } catch (e) {
      print("Error: $e");
      rethrow;
    } finally {
      headers.remove('Abp.TenantId');
    }
  }
}
