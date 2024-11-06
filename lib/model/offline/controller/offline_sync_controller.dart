import 'package:flutter_api_intrgration/Network/api_service.dart';
import 'package:flutter_api_intrgration/managers/messages/toast_manager.dart';
import 'package:flutter_api_intrgration/managers/pages/assistant_surgeon_manager.dart';
import 'package:flutter_api_intrgration/model/offline/model/offline_provider.dart';
import 'package:flutter_api_intrgration/model/offline/model/provider_response_model.dart';

class OfflineSyncController {
  ApiService _apiService = ApiService();
  AssistantSurgeonManager assistantHelper = AssistantSurgeonManager();

  /// [Get] Sync offline assistant surgeon data
  Future<void> syncOfflineAssistantSurgeon() async {
    try {
      // Open Hive box before syncing
      await assistantHelper.openHiveBox();

      // Fetch the response from API
      ProviderResponseModel response =
          await _apiService.getOfflineAssistantSurgeons();

      // Store the result in Hive
      await assistantHelper.saveOfflineAssistantSurgeons(response.result);
      ToastManager().showToast('Offline sync successfully done');

      // Retrieve and print the offline assistant surgeons
      List<OfflineProvider> offlineSurgeons =
          await assistantHelper.getOfflineAssistantSurgeons();
    } catch (e) {
      print('Error syncing assistant surgeons: $e');
    }
  }
}
