import 'package:flutter/material.dart';

class HelpControlGlucoseScreen extends StatelessWidget {
  const HelpControlGlucoseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controlling My Glucose'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Help Controlling My Glucose here'),
      ),
    );
  }
}
