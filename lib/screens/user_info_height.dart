import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/UserInfo.dart';

class UserInfoHeightScreen extends StatefulWidget {
  const UserInfoHeightScreen({Key? key}) : super(key: key);

  @override
  _UserInfoHeightScreenState createState() => _UserInfoHeightScreenState();
}

class _UserInfoHeightScreenState extends State<UserInfoHeightScreen> {
  int index = 0;

  static List<String> heights = [
    '1\' 6" ',
    '2\' 0"',
    '2\' 6"',
    '3\' 0"',
    '3\' 6"',
    '4\' 0"',
    '4\' 6"',
    '5\' 0"',
    '5\' 6"',
    '6\' 0"',
    '6\' 6"',
    '7\' 0"',
  ];

  late AuthUser _user;
  String selectedHeight = '';
  String currentHeight = '';

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
    if (userData.first.height != '') {
      setState(() {
        currentHeight = userData.first.height!;
      });
    } else {
      setState(() {
        currentHeight = 'Select Your Height';
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
        title: Text('Height'),
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
                  'Current Selected Height',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentHeight,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text('Select Your Current Height'),
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
                selectedHeight = heights[index];
                _updateUserInfo(_user.userId, selectedHeight);
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
    await Amplify.DataStore.save(userInfoData.copyWith(height: updatedData));
  }

  Widget buildCustomPicker() => SizedBox(
        height: 180,
        child: CupertinoPicker(
          itemExtent: 64,
          onSelectedItemChanged: (index) => setState(() => this.index = index),
          children: modelBuilder<String>(heights, (index, height) {
            return Center(
              child: Text(
                height,
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
