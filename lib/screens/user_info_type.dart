import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/UserInfo.dart';

class UserInfoTypeScreen extends StatefulWidget {
  const UserInfoTypeScreen({Key? key}) : super(key: key);

  @override
  _UserInfoTypeScreenState createState() => _UserInfoTypeScreenState();
}

class _UserInfoTypeScreenState extends State<UserInfoTypeScreen> {
  int index = 0;

  static List<String> types = [
    '22',
    'Healthy People',
    'IGT',
    'Type 1',
    'Type 2'
  ];

  late AuthUser _user;
  String selectedType = '';
  String currentDiabetesType = '';

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
    if (userData.first.diabetesType != '') {
      setState(() {
        currentDiabetesType = userData.first.diabetesType!;
      });
    } else {
      setState(() {
        currentDiabetesType = 'Enter Diabetes Type';
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
        title: Text('Diabetes Type'),
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
                  'Current Diabetes Type Selected',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  currentDiabetesType,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text('Select Your Diabetes Type'),
          ),
          buildCustomPicker(),
          SizedBox(
            height: 24,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                selectedType = types[index];
                _updateUserInfo(_user.userId, selectedType);
                Navigator.of(context).pop();
              },
              child: Text(
                'SAVE',
                style: TextStyle(fontSize: 18),
              ))
        ],
      )),
    );
  }

  Future _updateUserInfo(String userId, String updatedData) async {
    UserInfo userInfoData = (await Amplify.DataStore.query(UserInfo.classType,
        where: UserInfo.USERID.eq(userId)))[0];
    await Amplify.DataStore.save(
        userInfoData.copyWith(diabetesType: updatedData));
  }

  Widget buildCustomPicker() => SizedBox(
        height: 180,
        child: CupertinoPicker(
          itemExtent: 64,
          onSelectedItemChanged: (index) => setState(() => this.index = index),
          children: modelBuilder<String>(types, (index, type) {
            return Center(
              child: Text(
                type,
              ),
            );
          }),
        ),
      );

  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}
