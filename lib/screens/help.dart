import 'package:flutter/material.dart';
import 'package:iwelcgm/screens/help_read_data.dart';

import 'help_control_glucose.dart';
import 'help_replace_sensor.dart';
import 'help_setting_up.dart';
import 'help_share_data.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Help'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: ListView(
          padding: EdgeInsets.all(40.0),
          children: [
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Setting Up'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HelpSettingUpScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Reading My Data'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HelpReadDataScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Replacing My Sensor'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HelpReplaceSensorScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Sharing My Data'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HelpShareDataScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Controlling My Glucose'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HelpControlGlucoseScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
          ],
        ));
  }
}
