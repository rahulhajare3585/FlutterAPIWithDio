import 'package:flutter_api_intrgration/model/login_response_model.dart';
import 'package:flutter_api_intrgration/model/offline/controller/offline_sync_controller.dart';
import 'package:hive/hive.dart';

import '../model/tenant_request_model.dart';
import '../model/tenant_response_model.dart';
import '../Network/api_service.dart';
import '../model/login_model.dart';

class LoginPageController {
  ApiService _apiService = ApiService();

  ///[Post]
  Future<bool> authenticateUser(
      String tenantName, String username, String password) async {
    TenantRequestModel tenantData = TenantRequestModel(tenancyName: tenantName);
    TenantResponseModel apiResponse =
        await _apiService.checkTenantAvailability(tenantData);
    if (apiResponse?.success == true) {
      bool check = await validateUsers(username, password, apiResponse);
      return check ? true : false;
    } else {
      print('fail');
      return false;
    }
  }

  ///[Post]
  Future<bool> validateUsers(String username, String password,
      TenantResponseModel tenantResponse) async {
    LoginModel userData = LoginModel(
      userNameOrEmailAddress: username,
      password: password,
      tenancyName: 'FOI',
    );

    // Await the opening of the 'Authentication' box
    var box = await Hive.openBox('Authentication');

    await box.put('abp_tanant_id', tenantResponse.result?.tenantId.toString());

    LoginRespModel apiResponse = await _apiService.authenticateUser(
        userData, tenantResponse.result?.tenantId);

    if (apiResponse.success) {
      await box.put('access_token', apiResponse.result.accessToken.toString());
      OfflineSyncController().syncOfflineAssistantSurgeon();
      return true;
    }

    return false;
  }
}
