import 'package:flutter/material.dart';

class HelpReplaceSensorScreen extends StatelessWidget {
  const HelpReplaceSensorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replacing My Sensor'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Help Replacing Sensor here'),
      ),
    );
  }
}
