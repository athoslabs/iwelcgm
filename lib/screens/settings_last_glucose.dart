import 'package:flutter/material.dart';

class LastFastGlucoseScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LastFastGlucoseScreenState();
  }
}

class _LastFastGlucoseScreenState extends State<LastFastGlucoseScreen> {

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Last Fasting Glucose'),
        centerTitle: true,
      ),
    );
  }
}