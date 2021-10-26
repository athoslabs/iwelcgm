import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Text('News Articles here'),
      ),
    );
  }
}
