import 'package:flutter/material.dart';

class SupportAboutScreen extends StatelessWidget {
  const SupportAboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('About Information here'),
      ),
    );
  }
}
