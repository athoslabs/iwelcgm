import 'package:flutter/material.dart';

class CoachingScreen extends StatefulWidget {
  const CoachingScreen({Key? key}) : super(key: key);

  @override
  _CoachingScreenState createState() => _CoachingScreenState();
}

class _CoachingScreenState extends State<CoachingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coaching'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Coaching Information Here'),
      ),
    );
  }
}
