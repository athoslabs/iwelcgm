import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/UserInfo.dart';

class UserInfoGenderScreen extends StatefulWidget {
  const UserInfoGenderScreen({Key? key}) : super(key: key);

  @override
  _UserInfoGenderScreenState createState() => _UserInfoGenderScreenState();
}

class _UserInfoGenderScreenState extends State<UserInfoGenderScreen> {
  static const values = <String>["MALE", "FEMALE"];
  String selectedValue = values.first;
  late AuthUser _user;
  String currentGender = '';

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
        currentGender = userData.first.gender!;
      });
    } else {
      setState(() {
        currentGender = 'Enter Your Gender';
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
        title: Text('Gender'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  children: [
                    Text(
                      'Current Gender Selected',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      currentGender,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                'Select Your Gender',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Container(
                  child: buildRadios(),
                ),
              ),
              SizedBox(
                height: 125.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  _updateUserInfo(_user.userId, selectedValue);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _updateUserInfo(String userId, String updatedData) async {
    UserInfo userInfoData = (await Amplify.DataStore.query(UserInfo.classType,
        where: UserInfo.USERID.eq(userId)))[0];
    await Amplify.DataStore.save(userInfoData.copyWith(gender: updatedData));
  }

  Widget buildRadios() => Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.grey,
        ),
        child: Column(
          children: values.map(
            (value) {
              final selected = this.selectedValue == value;
              final color = selected ? Colors.teal : Colors.grey;

              return RadioListTile<String>(
                value: value,
                groupValue: selectedValue,
                title: Text(
                  value,
                  style: TextStyle(color: color),
                ),
                activeColor: Colors.teal,
                onChanged: (value) =>
                    setState(() => this.selectedValue = value!),
              );
            },
          ).toList(),
        ),
      );
}
