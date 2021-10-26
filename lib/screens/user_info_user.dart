import 'package:flutter/material.dart';
import 'package:iwelcgm/models/checkbox_state.dart';

class UserInfoUserScreen extends StatefulWidget {
  @override
  _UserInfoUserScreenState createState() => _UserInfoUserScreenState();
}

class _UserInfoUserScreenState extends State<UserInfoUserScreen> {
  final selections = [
    CheckBoxState(title: 'Night Shift'),
    CheckBoxState(title: 'Travel'),
    CheckBoxState(title: 'Stay up late'),
    CheckBoxState(title: 'Leisure'),
    CheckBoxState(title: 'Busy'),
    CheckBoxState(title: 'Other'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: ListView(
          padding: EdgeInsets.all(40),
          children: [
            ...selections.map(buildSingleCheckbox).toList(),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ));
  }

  Widget buildSingleCheckbox(CheckBoxState checkbox) => CheckboxListTile(
        activeColor: Colors.teal,
        value: checkbox.value,
        title: Text(
          checkbox.title,
          style: TextStyle(fontSize: 18),
        ),
        onChanged: (value) => setState(() => checkbox.value = value!),
      );
}
