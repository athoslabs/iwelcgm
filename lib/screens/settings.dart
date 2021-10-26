import 'package:flutter/material.dart';

// Screens
import '../screens/settings_graph_format.dart';
import '../screens/settings_alerts.dart';
import '../screens/settings_share_data.dart';
import '../screens/settings_last_glucose.dart';
import '../screens/settings_transmitter.dart';
import '../screens/settings_sensors.dart';


class SettingsScreen extends StatelessWidget {


  const SettingsScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Settings'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(40.0),
          children: [
            SizedBox(
              height: 24,
            ),
            ListTile(
              title: Text('Graph Format'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GraphFormatSettingScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Alerts'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AlertSettingsScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Share My Data'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShareDataScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Last Fasting Glucose'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LastFastGlucoseScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Transmitter'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TransmitterScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Sensors'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SensorsScreen(),
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
