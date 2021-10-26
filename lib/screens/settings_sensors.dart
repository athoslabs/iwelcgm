import 'package:flutter/material.dart';

class SensorsScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SensorsScreenState();
  }
}

class _SensorsScreenState extends State<SensorsScreen> {

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Sensors'),
        centerTitle: true,
      ),
    );
  }
}