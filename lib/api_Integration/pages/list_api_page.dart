import 'package:flutter/material.dart';
import 'package:flutter_api_intrgration/api_Integration/API/model/req_model.dart';
import 'package:flutter_api_intrgration/api_Integration/API/model/response_in_list_model.dart';
import 'package:flutter_api_intrgration/api_Integration/API/repository.dart';
import '../API/model/response_in_map_model.dart';

class ListApiPage extends StatefulWidget {
  const ListApiPage({super.key});

  @override
  State<ListApiPage> createState() => _HomePageState();
}

class _HomePageState extends State<ListApiPage> {
  List<dynamic> jsonList = [];
  bool loading = true;

  List<ResponseInListModel> responseInList = [];

  void getData() async {
    try {
      Repository().getResponseInList().then((value) {
        responseInList = value;
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
    print(responseInList);
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
          itemCount: responseInList?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            // Safely accessing res.data[index] with null-aware operators
            final item = responseInList?[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(child: Text(item?.id.toString() ?? "")),
                title: Text(item?.title?.toString() ?? ""),
                subtitle: Text(item?.body?.toString() ?? ""),
              ),
            );
          },
        ));
  }
}
