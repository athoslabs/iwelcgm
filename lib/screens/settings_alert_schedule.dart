import 'package:flutter/material.dart';

class AlertScheduleScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AlertScheduleScreenState();
  }
}

class _AlertScheduleScreenState extends State<AlertScheduleScreen> {

  final highAlertController = TextEditingController();
  final highActionController = TextEditingController();
  final lowAlertController = TextEditingController();
  final lowActionController = TextEditingController();

  bool _noSignal = false;
  bool _noReadings = false;

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
          _buildListTile('High Action', highActionController),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          _buildListTile('Low Alert', lowAlertController),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          _buildListTile('Low Action', lowActionController),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            title: Text('System Alerts', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            tileColor: Colors.teal,
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          SwitchListTile(
            activeColor: Colors.teal,
            title: Text('Signal Loss'),
            value: _noSignal,
            onChanged: (value) {
              setState(() {
                _noSignal = value;
              });
            } ,
          ),
          SwitchListTile(
            activeColor: Colors.teal,
            title: Text('No Readings'),
            value: _noReadings,
            onChanged: (value) {
              setState(() {
                _noReadings = value;
              });
            } ,
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
          border: InputBorder.none,
          hintText: '---',
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      ),
    ),
  );
}