import 'package:flutter/material.dart';

class SupportAccountScreen extends StatelessWidget {
  const SupportAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Account Information here'),
      ),
    );
  }
}
