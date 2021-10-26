import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/UserInfo.dart';

class UserInfoHistoryScreen extends StatefulWidget {
  const UserInfoHistoryScreen({Key? key}) : super(key: key);

  @override
  _UserInfoHistoryScreenState createState() => _UserInfoHistoryScreenState();
}

class _UserInfoHistoryScreenState extends State<UserInfoHistoryScreen> {
  final diabetesHistoryController = TextEditingController();
  String currentDiabetesHistory = '';

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
    if (userData.first.diabetesHistory != '') {
      setState(() {
        currentDiabetesHistory = userData.first.diabetesHistory!;
      });
    } else {
      setState(() {
        currentDiabetesHistory = 'Enter Family Diabetes History';
      });
    }
  }

  @override
  void initState() {
    diabetesHistoryController.addListener(() => setState(() {}));
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Family History'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  children: [
                    Text(
                      'Current Family Diabetes History',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      currentDiabetesHistory,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                    'Enter your family history of diabetes in the field below.'),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: diabetesHistoryController,
                  minLines: 1,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Enter Family Diabetes History Here',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 24.0, horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 50)),
                  onPressed: () async {
                    var newDiabetesHistory = diabetesHistoryController.text;
                    _updateUserInfo(_user.userId, newDiabetesHistory);
                    setState(() {
                      currentDiabetesHistory = diabetesHistoryController.text;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'SAVE',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ));
  }
}

Future _updateUserInfo(String userId, String updatedData) async {
  UserInfo userInfoData = (await Amplify.DataStore.query(UserInfo.classType,
      where: UserInfo.USERID.eq(userId)))[0];
  await Amplify.DataStore.save(
      userInfoData.copyWith(diabetesHistory: updatedData));
}
