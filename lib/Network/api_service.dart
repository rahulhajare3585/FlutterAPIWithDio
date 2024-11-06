import 'package:dio/dio.dart';
import 'package:flutter_api_intrgration/Network/config.dart';
import 'package:flutter_api_intrgration/Network/dio_interceptor.dart';
import 'package:flutter_api_intrgration/managers/messages/toast_manager.dart';
import 'package:flutter_api_intrgration/model/login_model.dart';
import 'package:flutter_api_intrgration/model/login_response_model.dart';
import 'package:flutter_api_intrgration/model/offline/model/provider_response_model.dart';
import 'package:flutter_api_intrgration/model/tenant_request_model.dart';
import 'package:flutter_api_intrgration/model/tenant_response_model.dart';
import 'package:hive/hive.dart';

class ApiService {
  final baseUrl = Config().baseUrl;
  final Dio dio = Dio();
  String? accessToken;

  // Define the headers without the tenant id initially
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Abp.TenantId': '4'
  };

  // Define the API endpoint URLs
  final String checkTenantAvailabilityUrl =
      '/api/services/app/Account/IsTenantAvailable';
  final String authenticateUserUrl = '/api/TokenAuth/Authenticate';
  final String getOfflineAssistantSurgeonsUrl =
      '/api/services/mobile/SyncDataMobile/GetAssistantSurgeons';

  ApiService() {
    // Add the DioInterceptor to the dio instance
    dio.interceptors.add(DioInterceptor());
  }

  ///[Post] Check Tenant Availability
  Future<TenantResponseModel> checkTenantAvailability(
      TenantRequestModel requestModel) async {
    try {
      Response response = await dio.post(
        '$baseUrl$checkTenantAvailabilityUrl',
        data: requestModel.toJson(),
        options: Options(headers: headers),
      );

      return TenantResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error: $e");

      // Show a Toast message on error
      ToastManager().showToast('Error : $e');

      return Future.error("Error: $e");
    }
  }

  /// [Post] Authenticate User
  Future<LoginRespModel> authenticateUser(
      LoginModel userdata, int? tenantId) async {
    headers['Abp.TenantId'] = tenantId.toString();

    try {
      Response response = await dio.post(
        '$baseUrl$authenticateUserUrl',
        data: userdata.toJson(),
        options: Options(headers: headers),
      );

      return LoginRespModel.fromJson(response.data);
    } catch (e) {
      print("Error: $e");

      ToastManager().showToast('Error : $e');

      return Future.error("Error: $e");
    } finally {
      headers.remove('Abp.TenantId');
    }
  }

  ///[Get] Get Offline Assistant Surgeons
  Future<ProviderResponseModel> getOfflineAssistantSurgeons() async {
    getAccessToken();
    headers['Abp.TenantId'] = await getAbpTenantId().toString();
    headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get(
        '$baseUrl$getOfflineAssistantSurgeonsUrl',
        options: Options(headers: headers),
      );

      return ProviderResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error: $e");

      ToastManager().showToast('Error : $e');

      return Future.error("Error: $e");
    } finally {
      headers.remove('Abp.TenantId');
    }
  }

  void getAccessToken() async {
    var box = await Hive.openBox('Authentication');
    accessToken = box.get('access_token');
  }

  Future<String?> getAbpTenantId() async {
    var box = await Hive.openBox('Authentication');
    String? tenant = box.get('abp_tanant_id');
    return tenant;
  }
}
