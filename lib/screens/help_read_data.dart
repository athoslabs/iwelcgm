import 'package:flutter/material.dart';

class HelpReadDataScreen extends StatelessWidget {
  const HelpReadDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading My Data'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Help Reading Data here'),
      ),
    );
  }
}
