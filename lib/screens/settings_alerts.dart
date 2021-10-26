import 'package:flutter/material.dart';

class AlertSettingsScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AlertSettingsScreenState();
  }
}

class _AlertSettingsScreenState extends State<AlertSettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Alert Settings'),
        centerTitle: true,
      ),
    );
  }
}