import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
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
