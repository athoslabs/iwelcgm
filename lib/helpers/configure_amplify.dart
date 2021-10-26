import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:iwelcgm/models/ModelProvider.dart';
import '../amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';

Future<void> configureAmplify() async {
  final auth = AmplifyAuthCognito();
  final analytics = AmplifyAnalyticsPinpoint();
  final AmplifyDataStore _dataStorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAPI _amplifyApi = AmplifyAPI();

  try {
    await Future.wait([
      Amplify.addPlugins([auth, analytics, _dataStorePlugin, _amplifyApi])
    ]);
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException catch (e) {
    print(e);
  }
}
