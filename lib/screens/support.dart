import 'package:flutter/material.dart';
import 'package:iwelcgm/screens/help_read_data.dart';
import 'package:iwelcgm/screens/support_about.dart';
import 'package:iwelcgm/screens/support_account.dart';
import 'package:iwelcgm/screens/support_contact.dart';

import 'help_control_glucose.dart';
import 'help_replace_sensor.dart';
import 'help_setting_up.dart';
import 'help_share_data.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Support'),
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
              title: Text('About'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SupportAboutScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Account'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SupportAccountScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Contact'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SupportContactScreen(),
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
