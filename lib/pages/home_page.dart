import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_api_intrgration/API/model/req_model.dart';
import 'package:flutter_api_intrgration/API/repository.dart';
import '../API/model/response_in_map_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> jsonList = [];
  bool loading = true;

  RsponseInMapModel res = RsponseInMapModel();
  void getData() async {
    try {
      Repository().getResponseInMap().then((value) {
        res = value;
        setState(() {
          loading = false;
        });
      }).onError((error, stackTrace) {
        print('Error => ${error.toString()}');
        return null;
      });
    } catch (e) {
      print("Exception: $e");
    }
    print(res);
  }

  @override
  void initState() {
    super.initState();
    getData();
    //checkTenant();
  }

  void checkTenant() async {
    ReqModel req = ReqModel(emailId: "eve.holt@reqres.in", password: 'pistol');
    var res = Repository().postApi(req);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('API Calls'),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: res?.data?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            // Safely accessing res.data[index] with null-aware operators
            final item = res?.data?[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item?.avatar ?? ""),
                ),
                title: Text(item?.firstName?.toString() ?? ""),
                subtitle: Text(item?.email?.toString() ?? ""),
              ),
            );
          },
        ));
  }
}
