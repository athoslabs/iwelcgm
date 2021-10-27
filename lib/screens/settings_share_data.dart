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
      body: ListView(
        padding: EdgeInsets.all(40.0),
        children: [
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            title: Text('By Email'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.teal,
            ),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            title: Text('By Text Message'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.teal,
            ),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}