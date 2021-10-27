// Packages
import 'package:flutter/material.dart';

// Screens
import '../screens/settings_alert_schedule.dart';

class AlertSettingsScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AlertSettingsScreenState();
  }
}

class _AlertSettingsScreenState extends State<AlertSettingsScreen> {

  bool value = true;
  bool _vibrateSounds = false;
  bool _vibrateSilent = false;
  bool _alwaysSound = false;
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
     body: ListView(
       padding: EdgeInsets.all(30.0),
       children: [
         SwitchListTile(
           activeColor: Colors.teal,
           title: Text('Vibrate With Sounds'),
             value: _vibrateSounds,
             onChanged: (value) {
           setState(() {
             _vibrateSounds = value;
           });
         }),
         Divider(
           height: 2,
           color: Colors.grey,
         ),
         SwitchListTile(
           activeColor: Colors.teal,
           title: Text('Vibrate on Silent'),
             value: _vibrateSilent,
             onChanged: (value) {
           setState(() {
             _vibrateSilent = value;
           });
         }),
         Divider(
           height: 2,
           color: Colors.grey,
         ),
         SwitchListTile(
           activeColor: Colors.teal,
           title: Text('Always Sound'),
             subtitle: Text('Allows alerts to sound even silent or Do Not Disturb are active'),
             value: _alwaysSound,
             onChanged: (value) {
           setState(() {
             _alwaysSound = value;
           });
         }),
         Divider(
           height: 2,
           color: Colors.grey,
         ),
         ListTile(
           title: Text('Alert Schedule'),
           subtitle: Text('Allows you to schedule and customize alerts', style: TextStyle(fontSize: 12),),
           trailing: Icon(
             Icons.arrow_forward_ios,
             color: Colors.teal,
           ),
           onTap: () {
             Navigator.of(context).push(MaterialPageRoute(
               builder: (context) => AlertScheduleScreen(),
             ));
           },
         ),
         Divider(
           height: 2,
           color: Colors.grey,
         ),
       ],
     ),
    );
  }

  Widget buildSwitch() => Switch.adaptive(
    activeColor: Colors.teal,
      activeTrackColor: Colors.teal.withOpacity(0.4),
      value: value,
      onChanged: (value) => setState(() {
    this.value = value;
  },),);
}