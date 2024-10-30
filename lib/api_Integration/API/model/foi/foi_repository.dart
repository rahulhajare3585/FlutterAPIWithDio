import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_intrgration/api_Integration/API/Helper/dio_helper.dart';
import 'package:flutter_api_intrgration/api_Integration/API/model/response_in_list_model.dart';

class FoiRepository {
  static final DioHelper _dioHelper = DioHelper();

  Future<dynamic> postApi(Object reqModel) async {
    var res = await _dioHelper.post(
        url: 'https://reqres.in/api/register',
        requestBody: reqModel,
        isAuthRequired: true);
    return res;
  }

  //Get
  Future<dynamic> checkTenantAvailabilty(Object reqModel) async {
    var res = await _dioHelper.get(
        url:
            'https://incisions-api-qa.azurewebsites.net/api/services/app/Account/IsTenantAvailable',
        isAuthRequired: true);
    return res;
  }
}
