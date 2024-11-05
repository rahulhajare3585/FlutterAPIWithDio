import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
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
        title: Text('Surgery'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          child: Text('Welcome'),
        ),
      ),
    );
  }
}
