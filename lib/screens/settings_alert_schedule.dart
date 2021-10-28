import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/Settings.dart';


class AlertScheduleScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AlertScheduleScreenState();
  }
}

class _AlertScheduleScreenState extends State<AlertScheduleScreen> {
  late AuthUser _user;

  Future<void> _getUser() async {
    await Future.wait([
      Amplify.Auth.getCurrentUser().then((user) {
        setState(() {
          _user = user;
        });
      })
    ]);
    getUserSettings(userId: _user.userId);
  }

  Future getUserSettings({required String userId}) async {

    List<Settings> userSettings = await Amplify.DataStore.query(Settings.classType,
        where: Settings.USERID.eq(userId));
      setState(() {
        highAlert = userSettings.first.highAlert!.toString();
        highAction = userSettings.first.highAction!.toString();
        lowAlert = userSettings.first.lowAlert!.toString();
        lowAction = userSettings.first.lowAction!.toString();
        _noSignal = userSettings.first.signalLoss!;
        _noReadings = userSettings.first.noReadings!;
      });

  }

  final highAlertController = TextEditingController();
  final highActionController = TextEditingController();
  final lowAlertController = TextEditingController();
  final lowActionController = TextEditingController();

  String highAlert = '0';
  String highAction = '0';
  String lowAlert = '0';
  String lowAction = '0';

  bool _noSignal = false;
  bool _noReadings = false;

  @override
  void initState() {
    _getUser();
    highAlertController.addListener(() => setState(() {}));
    highActionController.addListener(() => setState(() {}));
    lowAlertController.addListener(() => setState(() {}));
    lowActionController.addListener(() => setState(() {}));
    super.initState();
  }


  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        _updateSettingsInfo(_user.userId, _noSignal, _noReadings);
        return true;
      },
    child: Scaffold(
  appBar: AppBar(
  backgroundColor: Colors.teal,
    title: Text('Alert Schedule'),
    centerTitle: true,
  ),
  body: ListView(
  padding: EdgeInsets.all(30.0),
  children: [
    ListTile(
    title: Text('Glucose Alerts', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
    tileColor: Colors.teal,
    ),
    Divider(
    height: 2,
    color: Colors.grey,
    ),
    _buildListTile('High Alert', highAlertController, highAlert),
    Divider(
    height: 2,
    color: Colors.grey,
    ),
    _buildListTile('High Action', highActionController, highAction),
    Divider(
    height: 2,
    color: Colors.grey,
    ),
    _buildListTile('Low Alert', lowAlertController, lowAlert),
    Divider(
    height: 2,
    color: Colors.grey,
    ),
    _buildListTile('Low Action', lowActionController, lowAction),
    Divider(
    height: 2,
    color: Colors.grey,
    ),
    ListTile(
    title: Text('System Alerts', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
    tileColor: Colors.teal,
    ),
    Divider(
    height: 2,
    color: Colors.grey,
    ),
    SwitchListTile(
    activeColor: Colors.teal,
    title: Text('Signal Loss'),
    value: _noSignal,
    onChanged: (value) {
    setState(() {
    _noSignal = value;
    });
    } ,
    ),
    SwitchListTile(
    activeColor: Colors.teal,
    title: Text('No Readings'),
    value: _noReadings,
    onChanged: (value) {
    setState(() {
    _noReadings = value;
    });
    } ,
    ),
    ],
    ),
    ),
    );

  Future _updateSettingsInfo(
      String userId,
      bool updatedNoSignal,
      bool updatedNoReadings) async {
    Settings userSettingsData = (await Amplify.DataStore.query(Settings.classType,
        where: Settings.USERID.eq(userId)))[0];
      await Amplify.DataStore.save(userSettingsData.copyWith(
        highAlert: int.parse(highAlertController.text),
        highAction: int.parse(highActionController.text),
        lowAlert: int.parse(lowAlertController.text),
        lowAction: int.parse(lowActionController.text),
        signalLoss: updatedNoSignal,
        noReadings: updatedNoReadings,
      ),
    );
  }

  Widget _buildListTile(String _title, TextEditingController _controller, String alertValue) => ListTile(
    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
    title: Text(_title),
    trailing: Container(
      height: 50,
      width: 70,
      child: TextField(
        cursorColor: Colors.teal,
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: alertValue,
        ),
        onChanged: (value) => setState(() {
          alertValue = value;
        }),
        onSubmitted: (value) => setState(() {
          alertValue = value;
        }),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      ),
    ),
  );



}