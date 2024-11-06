import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityManager {
  // Singleton pattern for a single instance of ConnectivityManager
  static final ConnectivityManager _instance = ConnectivityManager._internal();
  factory ConnectivityManager() => _instance;
  ConnectivityManager._internal();

  // Check the current network connectivity status
  Future<String> checkNetworkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    switch (connectivityResult) {
      case ConnectivityResult.none:
        return "No internet connection";
      case ConnectivityResult.mobile:
        return "Connected to mobile network";
      case ConnectivityResult.wifi:
        return "Connected to WiFi";
      default:
        return "Unknown connectivity status";
    }
  }

  // Listen for connectivity changes
  Stream<String> listenToConnectivityChanges() {
    return Connectivity()
        .onConnectivityChanged
        .map((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.none:
          return "No internet connection";
        case ConnectivityResult.mobile:
          return "Connected to mobile network";
        case ConnectivityResult.wifi:
          return "Connected to WiFi";
        default:
          return "Unknown connectivity status";
      }
    });
  }
}
