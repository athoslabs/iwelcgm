import 'package:flutter/material.dart';

class ShareDataScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ShareDataScreenState();
  }
}

class _ShareDataScreenState extends State<ShareDataScreen> {

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Share My Data'),
        centerTitle: true,
      ),
    );
  }
}