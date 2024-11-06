import 'package:flutter_api_intrgration/model/offline/model/provider_response_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_api_intrgration/model/offline/model/offline_provider.dart';

class AssistantSurgeonManager {
  late Box<OfflineProvider> _assistantSurgeonBox;

  // Open the Hive box for offline assistant surgeons
  Future<void> openHiveBox() async {
    await Hive.initFlutter(); // Initialize Hive if not already initialized
    _assistantSurgeonBox =
        await Hive.openBox<OfflineProvider>('assistant_surgeons');
  }

  // Save offline assistant surgeons to the Hive box
  Future<void> saveOfflineAssistantSurgeons(List<Provider> surgeons) async {
    // Clear any previous data before saving new data
    await _assistantSurgeonBox.clear();

    // Convert each Provider to OfflineProvider and save to the Hive box
    for (var surgeon in surgeons) {
      OfflineProvider offlineSurgeon = OfflineProvider.fromProvider(surgeon);
      await _assistantSurgeonBox.add(offlineSurgeon);
    }
  }

  // Retrieve offline assistant surgeons from the Hive box
  Future<List<OfflineProvider>> getOfflineAssistantSurgeons() async {
    List<OfflineProvider> offlineSurgeons = [];
    for (var surgeon in _assistantSurgeonBox.values) {
      offlineSurgeons.add(surgeon);
    }
    return offlineSurgeons;
  }

  // Optional: Close the Hive box when done to prevent memory leaks
  Future<void> closeHiveBox() async {
    await _assistantSurgeonBox.close();
  }
}
