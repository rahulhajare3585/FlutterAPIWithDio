import 'package:flutter/material.dart';
import 'package:flutter_api_intrgration/managers/connections/connectivity_manager.dart';
import 'package:flutter_api_intrgration/managers/messages/toast_manager.dart';
import 'package:hive/hive.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    checkNetworkConnectivity();
    _openHiveBox(); // Call the async function here
  }

  Future<void> _openHiveBox() async {
    var box = await Hive.openBox("surgery");
    // print(box.name);
    // print(box.path);

    var data = Hive.box('surgery');
    data.put('id', 1);
    data.put('patientName', 'Rahul Hajare');
    DateTime today = DateTime.now();
    data.put('surgeryDate', today);
    print(data.values);
    print(data.keys);
    print(data.length);

    // get
    print('getData');
    print(data.get('id'));
    print(data.get('patientName'));
    print(data.get('surgeryDate'));
    print(data.get('x'));

    //put
    print('Put data');
    DateTime yesterday = DateTime.now().add(Duration(days: -1));
    data.put('surgeryDate', yesterday);

    print(data.get('patientName'));
    print(data.get('surgeryDate'));

    // delete
    print('delete');
    data.delete('patientName');
    print(data.get('patientName'));
    data.deleteAll(data.keys);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/foi_login_screen');
                      },
                      child: Text('FOI')),

                  //cupertino widgets
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Cupertino Widgets'),
                  //action sheet
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/action_sheet');
                      },
                      child: Text('Action Sheet ')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/scrollBar');
                      },
                      child: const Text('Scroll Bar')),

                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/context_menu');
                      },
                      child: const Text('Context Menu')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/alertDialog');
                      },
                      child: const Text('Alert Dialog')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/buttons');
                      },
                      child: const Text('Buttons')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/form_rows');
                      },
                      child: const Text('Form Row')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/indicator');
                      },
                      child: const Text('Indicator')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/cupertino/page_scaffold');
                      },
                      child: const Text('Page Scaffold')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/picker');
                      },
                      child: const Text('Picker')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/radio');
                      },
                      child: const Text('Radio')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/slider');
                      },
                      child: const Text('Slider')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/switch');
                      },
                      child: const Text('Slider')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/tabbar');
                      },
                      child: const Text('Tab Bar')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/date_picker');
                      },
                      child: const Text('Date Picker')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/cupertino/editable_text');
                      },
                      child: const Text('Editable Text')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/listsection');
                      },
                      child: const Text('List Section')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/cupertino/refresh_control');
                      },
                      child: const Text('Refresh')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/cupertino/search_text_field');
                      },
                      child: const Text('Search Text')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/cupertino/segamented_control');
                      },
                      child: const Text('Segamented Control')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/cupertino/sliver_nav_bar');
                      },
                      child: const Text('Sliver Nav Bar')),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cupertino/timer_picker');
                      },
                      child: const Text('Time Picker')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkNetworkConnectivity() async {
    String status = await ConnectivityManager().checkNetworkConnectivity();
    print(status);
    listenToChanges();
  }

  void listenToChanges() {
    ConnectivityManager().listenToConnectivityChanges().listen((status) {
      print("Network status changed: $status");
      setState(() {
        switch (status) {
          case "No internet connection":
            Navigator.pushReplacementNamed(context, '/patient_screen');
            ToastManager().showToast(status);
            break;
          default:
            Navigator.pushReplacementNamed(context, '/landing_screen');
            ToastManager().showToast(status);
            break;
        }
      });
    });
  }
}
