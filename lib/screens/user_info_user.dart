import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/UserInfo.dart';


class UserInfoUserScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _UserInfoUserScreenState();
  }
}

class _UserInfoUserScreenState extends State<UserInfoUserScreen> {
  String _phoneNumber = '';
  String _dateOfBirth = '';
  String _gender = '';
  String _height = '';
  String _weight = '';
  String _diabetesType = '';
  String _yearDiagnosed = '';
  String _familyHistory = '';
  String _paceOfLife = '';
  String _livingHabits = '';

  late AuthUser _user;

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

      setState(() {
        _phoneNumber = userData.first.phoneNumber!;
        _dateOfBirth = userData.first.dateOfBirth!;
        _gender = userData.first.gender!;
        _height = userData.first.height!;
        _weight = userData.first.weight!;
        _diabetesType = userData.first.diabetesType!;
        _yearDiagnosed = userData.first.yearDiagnosed!;
        _familyHistory = userData.first.diabetesHistory!;
        _paceOfLife = userData.first.paceOfLife!;
        _livingHabits = userData.first.habits!;
      });


  }

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('User Summary'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(40.0),
        children: [
          ListTile(
            title: Text('Mobile Number: $_phoneNumber', style: TextStyle(fontSize: 14),),
          ),
          ListTile(
            title: Text('Date Of Birth: $_dateOfBirth', style: TextStyle(fontSize: 14),),
          ),
          ListTile(
            title: Text('Gender: $_gender', style: TextStyle(fontSize: 14),),
          ),
          ListTile(
            title: Text('Height: $_height', style: TextStyle(fontSize: 14),),
          ),
          ListTile(
            title: Text('Weight: $_weight lbs.', style: TextStyle(fontSize: 14),),
          ),
          ListTile(
            title: Text('Diabetes Type: $_diabetesType', style: TextStyle(fontSize: 14),),
          ),
          ListTile(
            title: Text('Diagnosed Year: $_yearDiagnosed', style: TextStyle(fontSize: 14),),
          ),
          ListTile(
            title: Text('Family History: $_familyHistory', style: TextStyle(fontSize: 14),),
          ),
          ListTile(
            title: Text('Pace Of Life: $_paceOfLife', style: TextStyle(fontSize: 14),),
          ),
          ListTile(
            title: Text('Living Habits: $_livingHabits', style: TextStyle(fontSize: 14),),
          ),
        ],
      ),
    );
  }
}

