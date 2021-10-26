import 'package:flutter/material.dart';

class HelpShareDataScreen extends StatelessWidget {
  const HelpShareDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharing My Data'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Help Sharing My Data here'),
      ),
    );
  }
}
