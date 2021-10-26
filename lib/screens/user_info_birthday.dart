import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/UserInfo.dart';
import 'package:intl/intl.dart';

class UserInfoBirthdayScreen extends StatefulWidget {
  const UserInfoBirthdayScreen({Key? key}) : super(key: key);

  @override
  _UserInfoBirthdayScreenState createState() => _UserInfoBirthdayScreenState();
}

class _UserInfoBirthdayScreenState extends State<UserInfoBirthdayScreen> {
  DateTime dateTime = DateTime.now();
  late AuthUser _user;
  String updatedDateOFBirth = '';
  String currentDateOfBirth = '';

  Future<void> _getUser() async {
    await Future.wait([
      Amplify.Auth.getCurrentUser().then((user) {
        setState(() {
          _user = user;
        });
      })
    ]);
    getUserData(userId: _user.userId);
  }

  Future getUserData({required String userId}) async {
    List<UserInfo> userData = await Amplify.DataStore.query(UserInfo.classType,
        where: UserInfo.USERID.eq(userId));
    if (userData.first.dateOfBirth != '') {
      setState(() {
        currentDateOfBirth = userData.first.dateOfBirth!;
      });
    } else {
      setState(() {
        currentDateOfBirth = 'Enter Date Of Birth';
      });
    }
  }

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                children: [
                  Text(
                    'Current Date of birth',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    currentDateOfBirth,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Text('Select Your Date of Birth'),
            ),
            SizedBox(
              height: 40,
            ),
            buildDatePicker(),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50)),
                onPressed: () {
                  updatedDateOFBirth =
                      DateFormat('MM/dd/yyyy').format(dateTime);
                  _updateUserInfo(_user.userId, updatedDateOFBirth);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }

  Future _updateUserInfo(String userId, String updatedData) async {
    UserInfo userInfoData = (await Amplify.DataStore.query(UserInfo.classType,
        where: UserInfo.USERID.eq(userId)))[0];
    await Amplify.DataStore.save(
        userInfoData.copyWith(dateOfBirth: updatedData));
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          minimumYear: 1900,
          maximumYear: DateTime.now().year,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
