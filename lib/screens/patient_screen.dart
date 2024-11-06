import 'package:flutter/material.dart';
import 'package:flutter_api_intrgration/managers/pages/assistant_surgeon_manager.dart';
import 'package:flutter_api_intrgration/model/offline/model/offline_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  final AssistantSurgeonManager assistantHelper = AssistantSurgeonManager();
  List<OfflineProvider> offlineSurgeons = [];
  List<String> assistantSurgeonurgeonList = [];

  @override
  void initState() {
    super.initState();

    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      await assistantHelper.openHiveBox();
      await getAssistantSurgeons();
    } catch (e) {
      print('Error initializing data: $e');
    }
  }

  Future<void> getAssistantSurgeons() async {
    try {
      offlineSurgeons = await assistantHelper.getOfflineAssistantSurgeons();
      offlineSurgeons.forEach((surgeon) {
        print('Surgeon ID: ${surgeon.id}, Name: ${surgeon.name}');
      });
      _convertToDropdownItems(offlineSurgeons);
    } catch (e) {
      print('Error retrieving surgeons: $e');
    }
  }

  void _convertToDropdownItems(List<OfflineProvider> surgeons) {
    setState(() {
      assistantSurgeonurgeonList =
          surgeons.map((surgeon) => surgeon.name).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assistant Surgeons',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Text('Assistant Surgeon')),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownSearch<String>(
              popupProps: const PopupProps.menu(
                showSearchBox: true,
              ),
              items: assistantSurgeonurgeonList,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  hintText: "Select a surgeon",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(0xFF, 0xC4, 0xC4, 0xC4)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  border: OutlineInputBorder(),
                ),
              ),
              onChanged: (String? selectedSurgeon) {
                print("Selected Surgeon: $selectedSurgeon");
              },
            ),
          ),
        ],
      ),
    );
  }
}
