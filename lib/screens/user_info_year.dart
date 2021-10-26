import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/UserInfo.dart';
import 'package:intl/intl.dart';

class UserInfoYearScreen extends StatefulWidget {
  const UserInfoYearScreen({Key? key}) : super(key: key);

  @override
  _UserInfoYearScreenState createState() => _UserInfoYearScreenState();
}

class _UserInfoYearScreenState extends State<UserInfoYearScreen> {
  DateTime dateTime = DateTime.now();
  late AuthUser _user;
  String updatedYearDiagnosed = '';
  String currentYearDiagnosed = '';

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
    if (userData.first.yearDiagnosed != '') {
      setState(() {
        currentYearDiagnosed = userData.first.yearDiagnosed!;
      });
    } else {
      setState(() {
        currentYearDiagnosed = 'Enter Year Diagnosed';
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
        title: Text('Diagnosed Year'),
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
                    'Current Year Diagnosed ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    currentYearDiagnosed,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Text('Select the date you were diagnosed'),
            ),
            SizedBox(
              height: 15,
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
                  updatedYearDiagnosed =
                      DateFormat('MM/dd/yyyy').format(dateTime);
                  _updateUserInfo(_user.userId, updatedYearDiagnosed);
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
        userInfoData.copyWith(yearDiagnosed: updatedData));
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          minimumYear: 1900,
          maximumYear: DateTime.now().year,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) => setState(() => {
                this.dateTime = dateTime,
              }),
        ),
      );
}
