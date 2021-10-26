import 'package:flutter/material.dart';

class TransmitterScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TransmitterScreenState();
  }
}

class _TransmitterScreenState extends State<TransmitterScreen> {

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Transmitter'),
        centerTitle: true,
      ),
    );
  }
}