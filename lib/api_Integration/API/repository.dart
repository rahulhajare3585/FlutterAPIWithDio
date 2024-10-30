import 'package:flutter_api_intrgration/api_Integration/API/Helper/dio_helper.dart';
import 'package:flutter_api_intrgration/api_Integration/API/model/response_in_list_model.dart';
import 'model/response_in_map_model.dart';

class Repository {
  static final DioHelper _dioHelper = DioHelper();

  Future<dynamic> postApi(Object reqModel) async {
    var res = await _dioHelper.post(
        url: 'https://reqres.in/api/register',
        requestBody: reqModel,
        isAuthRequired: true);
    return res;
  }

  //Get
  Future<dynamic> getAPI(Object reqModel) async {
    var res = await _dioHelper.get(
        url: 'https://reqres.in/api/register', isAuthRequired: true);
    return res;
  }

  //patch
  Future<dynamic> patchAPI(Object reqModel) async {
    var res = await _dioHelper.patch(
        url: 'https://reqres.in/api/register',
        requestBody: reqModel,
        isAuthRequired: true);
    return res;
  }

  //delete
  Future<dynamic> deleteAPI(Object reqModel) async {
    var res = await _dioHelper.delete(
        url: 'https://reqres.in/api/register', isAuthRequired: true);
    return res;
  }

  // response in map
  Future<RsponseInMapModel> getResponseInMap() async {
    var res = await _dioHelper.get(
        url: 'https://reqres.in/api/users?page=2', isAuthRequired: true);

    // Check if the response and data are not null and then pass the data
    if (res != null && res.data != null) {
      return RsponseInMapModel.fromJson(res.data as Map<String, dynamic>);
    } else {
      throw Exception("Failed to load data");
    }
  }

  // response in List
  Future<List<ResponseInListModel>> getResponseInList() async {
    var response = await _dioHelper.get(
      url: 'https://jsonplaceholder.typicode.com/posts',
    );

    // Ensure response is not null, and cast the data to List<dynamic>
    if (response != null && response.data is List) {
      return (response.data as List)
          .map((item) => ResponseInListModel.fromJson(item))
          .toList();
    } else {
      throw Exception("Failed to load data");
    }
  }

  // response in List without model
  Future<dynamic> getResponseInListWithoutModel() async {
    var response = await _dioHelper.get(
      url: 'https://jsonplaceholder.typicode.com/posts',
    );

    // Ensure response is not null, and cast the data to List<dynamic>
    if (response != null) {
      return response;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
