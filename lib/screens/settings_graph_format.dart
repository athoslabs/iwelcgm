import 'package:flutter/material.dart';

class GraphFormatSettingScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _GraphFormatSettingScreenState();
  }
}

class _GraphFormatSettingScreenState extends State<GraphFormatSettingScreen> {

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Graph Format'),
        centerTitle: true,
      ),
    );
  }
}