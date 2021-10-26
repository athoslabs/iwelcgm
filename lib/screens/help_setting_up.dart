import 'package:flutter/material.dart';

class HelpSettingUpScreen extends StatelessWidget {
  const HelpSettingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Up'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Help Setting Up here'),
      ),
    );
  }
}
