import 'package:flutter/material.dart';

class AlertScheduleScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AlertScheduleScreenState();
  }
}

class _AlertScheduleScreenState extends State<AlertScheduleScreen> {

  final highAlertController = TextEditingController();

  @override
  void initState() {
    super.initState();
    highAlertController.addListener(() => setState(() {

    },),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Alert Schedule'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: [
          ListTile(
            title: Text('Glucose Alerts', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            tileColor: Colors.teal,
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
         _buildListTile('High Alert', highAlertController),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            title: Text('High Action'),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Low Alert'),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Low Action'),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Low Action Soon'),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String _title, TextEditingController _controller) => ListTile(
    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
    title: Text(_title),
    trailing: Container(
      height: 50,
      width: 70,
      child: TextField(
        cursorColor: Colors.teal,
        controller: _controller,
        decoration: InputDecoration(
          hintText: '---',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal, width: 2.0)
          )
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      ),
    ),
  );
}