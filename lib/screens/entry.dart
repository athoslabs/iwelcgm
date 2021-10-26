import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';

import 'package:iwelcgm/amplifyconfiguration.dart';
import 'package:iwelcgm/models/ModelProvider.dart';
import '../widgets/login.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    final auth = AmplifyAuthCognito();
    // final analytics = AmplifyAnalyticsPinpoint();
    final AmplifyAPI _apiPlugin = AmplifyAPI();
    final AmplifyDataStore _dataStorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);

    try {
      if (Amplify.isConfigured) {
        return;
      } else {
        await Future.wait([
          Amplify.addPlugins([auth, _dataStorePlugin, _apiPlugin])
        ]);
        await Amplify.configure(amplifyconfig);
      }

      setState(() {
        _amplifyConfigured = true;
      });
    } on AmplifyAlreadyConfiguredException catch (e) {
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: _amplifyConfigured ? Login() : CircularProgressIndicator(),
      ),
    );
  }
}
