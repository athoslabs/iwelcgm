import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/UserInfo.dart';

class UserInfoWeightScreen extends StatefulWidget {
  const UserInfoWeightScreen({Key? key}) : super(key: key);

  @override
  _UserInfoWeightScreenState createState() => _UserInfoWeightScreenState();
}

class _UserInfoWeightScreenState extends State<UserInfoWeightScreen> {
  int index = 0;

  static List<String> weights = [
    '05',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '55',
    '60',
    '65',
    '70',
    '75',
    '80',
    '85',
    '90',
    '95',
    '100',
    '105',
    '110',
    '115',
    '120',
    '125',
    '130',
    '135',
    '140',
    '145',
    '150',
    '155',
    '160',
    '165',
    '170',
    '175',
    '180',
    '185',
    '190',
    '195',
    '200',
    '205',
    '210',
    '215',
    '220',
    '225',
    '230',
    '235',
    '240',
    '245',
    '250',
    '255',
    '260',
    '265',
    '270',
    '275',
    '280',
    '285',
    '290',
    '295',
    '300',
    '305',
    '310',
    '315',
    '320',
    '325',
    '330',
    '335',
    '340',
    '345',
    '350',
    '355',
    '360',
    '365',
    '370',
    '375',
    '380',
    '385',
    '390',
    '395',
  ];

  late AuthUser _user;
  String selectedWeight = '';
  String currentWeight = '';

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
    if (userData.first.weight != '') {
      setState(() {
        currentWeight = userData.first.weight!;
      });
    } else {
      setState(() {
        currentWeight = 'Select Your Weight';
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
        title: Text('Weight'),
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
                  'Current Weight',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentWeight,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'lbs.',
                        style: TextStyle(fontSize: 16),
                      )
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
            child: Text('Select Your Current Weight'),
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
                selectedWeight = weights[index];
                _updateUserInfo(_user.userId, selectedWeight);
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
    await Amplify.DataStore.save(userInfoData.copyWith(weight: updatedData));
  }

  Widget buildCustomPicker() => SizedBox(
        height: 180,
        child: CupertinoPicker(
          itemExtent: 64,
          onSelectedItemChanged: (index) => setState(() => this.index = index),
          children: modelBuilder<String>(weights, (index, weight) {
            return Center(
              child: Text(
                weight,
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
