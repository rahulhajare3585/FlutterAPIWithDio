import 'dart:io';

class DeviceManager {
  // Method to get the device platform
  String getDevicePlatform() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isMacOS) {
      return 'MacOS';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else {
      return 'Unknown Platform';
    }
  }
}
