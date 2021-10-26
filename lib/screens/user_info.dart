import 'package:flutter/material.dart';
import 'package:iwelcgm/screens/user_info_birthday.dart';
import 'package:iwelcgm/screens/user_info_gender.dart';
import 'package:iwelcgm/screens/user_info_habits.dart';
import 'package:iwelcgm/screens/user_info_height.dart';
import 'package:iwelcgm/screens/user_info_history.dart';
import 'package:iwelcgm/screens/user_info_pace.dart';
import 'package:iwelcgm/screens/user_info_phone.dart';
import 'package:iwelcgm/screens/user_info_type.dart';
import 'package:iwelcgm/screens/user_info_user.dart';
import 'package:iwelcgm/screens/user_info_weight.dart';
import 'package:iwelcgm/screens/user_info_year.dart';

class UserInfoScreen extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserInfoScreen({Key? key, required this.name, required this.urlImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('User Information'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(40.0),
          children: [
            Text(
              'Improve user information to get better service. The following input fields are mandatory.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24,
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('User'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoUserScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Mobile Number'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoPhoneScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Birthday'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoBirthdayScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Gender'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoGenderScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Height'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoHeightScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Weight'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoWeightScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Diabetes Type'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoTypeScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Diagnosed Year'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoYearScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Family History of Diabetes'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoHistoryScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('The Pace of Life'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoPaceScreen(),
                ));
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Living Habits'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoHabitsScreen(),
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
