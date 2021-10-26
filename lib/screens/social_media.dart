import 'package:flutter/material.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Media'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Connect With Social Media Here'),
      ),
    );
  }
}
