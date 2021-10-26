import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/UserInfo.dart';
import 'package:iwelcgm/models/checkbox_state.dart';

class UserInfoHabitsScreen extends StatefulWidget {
  @override
  _UserInfoHabitsScreenState createState() => _UserInfoHabitsScreenState();
}

class _UserInfoHabitsScreenState extends State<UserInfoHabitsScreen> {
  late AuthUser _user;

  final selections = [
    CheckBoxState(title: 'Smoking'),
    CheckBoxState(title: 'Drinking'),
    CheckBoxState(title: 'Alcoholism'),
    CheckBoxState(title: 'Overeating'),
    CheckBoxState(title: 'Regular Lifestyle'),
    CheckBoxState(title: 'Have Meals Regularly'),
    CheckBoxState(title: 'Stay Up Late'),
    CheckBoxState(title: 'Sloppy Lifestyle'),
    CheckBoxState(title: 'Clean Lifestyle'),
  ];

  List<String> habits = [];

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
    if (userData.first.gender != '') {
      setState(() {
        habits = userData.first.habits as List<String>;
      });
    } else {
      setState(() {
        //currentGender = 'Enter Your Gender';
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
          title: Text('Living Habits'),
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
                  _updateUserInfo(_user.userId, habits.toString());
                  Navigator.of(context).pop();
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ));
  }

  Future _updateUserInfo(String userId, String updatedData) async {
    UserInfo userInfoData = (await Amplify.DataStore.query(UserInfo.classType,
        where: UserInfo.USERID.eq(userId)))[0];
    await Amplify.DataStore.save(userInfoData.copyWith(habits: updatedData));
  }

  Widget buildSingleCheckbox(CheckBoxState checkbox) => CheckboxListTile(
        activeColor: Colors.teal,
        value: checkbox.value,
        title: Text(
          checkbox.title,
          style: TextStyle(fontSize: 18),
        ),
        // onChanged: (value) => setState(() {checkbox.value = value})
        onChanged: (value) => {
          setState(() {
            checkbox.value = value!;
            if (checkbox.value == true) {
              habits.add(checkbox.title);
              print('THE HABIT IS: $habits');
            }
            if (checkbox.value == false) {
              habits.remove(checkbox.title);
              print('THE HABIT IS: $habits');
            }
          })
        },
      );
}
