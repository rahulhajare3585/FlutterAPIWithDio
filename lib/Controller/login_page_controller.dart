import 'package:flutter_api_intrgration/model/login_response_model.dart';

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
    LoginModel userData = new LoginModel(
        userNameOrEmailAddress: username,
        password: password,
        tenancyName: 'FOI');
    LoginRespModel apiResponse = await _apiService.authenticateUser(
        userData, tenantResponse.result?.tenantId);
    if (apiResponse.success) return true;
    return false;
  }
}
