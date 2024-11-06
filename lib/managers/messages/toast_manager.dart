import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastManager {
  void showToast(String messageString) {
    Fluttertoast.showToast(
      msg: messageString,
      toastLength: Toast.LENGTH_SHORT, // Toast length (short or long)
      gravity: ToastGravity.BOTTOM, // Toast position (TOP, BOTTOM, or CENTER)
      timeInSecForIosWeb: 2, // Duration for iOS/Web
      backgroundColor:
          Color.fromARGB(0xFF, 0x28, 0x60, 0xDF), // Background color
      textColor: Colors.white, // Text color
      fontSize: 16.0, // Font size
    );
  }
}
