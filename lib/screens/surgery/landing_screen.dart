import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landing screen'),
      ),
      body: Container(
        child: Text('Welcome'),
      ),
    );
  }
}
