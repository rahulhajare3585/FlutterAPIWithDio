import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../../../model/tenant_request_model.dart';
import '../../../../../Network/api_service.dart';

class TenantPage extends StatefulWidget {
  const TenantPage({super.key});

  @override
  State<TenantPage> createState() => _TenantPage();
}

class _TenantPage extends State<TenantPage> {
  Dio dio = Dio();
  ApiService _apiService = ApiService();

  @override
  void initState() {
    checkTenant();
    super.initState();
  }

  void checkTenant() async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Abp.TenantId': 'Your_Tenant_Id', // Replace with actual tenant id
    };

    try {
      TenantRequestModel req = TenantRequestModel(tenancyName: 'FOI');
      var response = await _apiService.checkTenantAvailability(req);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Calls'),
        backgroundColor: Colors.blue,
      ),
      body: Container(width: 200),
    );
  }
}
