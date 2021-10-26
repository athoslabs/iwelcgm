import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:iwelcgm/screens/confirm_reset.dart';
import '../models/UserInfo.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> _logUserOut() async {
    await Amplify.Auth.signOut();
    print('USER IS LOGGED OUT');
  }

  @override
  void initState() {
    _logUserOut();
    super.initState();
  }

  late LoginData _data;

  bool _isSignUpComplete = false;
  bool _isSignedIn = false;

  Future<String> _onLogin(LoginData data) async {
    try {
      final res = await Amplify.Auth.signIn(
        username: data.name,
        password: data.password,
      ).then((_) {
        _isSignedIn = true;
      });
      setState(() {
        // if (_isSignedIn) {
        //   // Navigator.pushReplacementNamed(context, '/dashboard');
        //
        // }
      });
      Navigator.pushReplacementNamed(context, '/devices');
      print('USER: ${data.name} HAS SUCCESSFULLY SIGNED IN');
    } on AuthException catch (e) {
      if (e.message.contains('already a user which is signed in')) {
        await Amplify.Auth.signOut();
        return 'Problem logging in. Please try again.';
      }
      print(e.message);
      return '${e.message} - ${e.recoverySuggestion}';
    }
    return '';
  }

  Future<String> _onRecoverPassword(BuildContext context, String email) async {
    try {
      final res = await Amplify.Auth.resetPassword(username: email);

      if (res.nextStep.updateStep == 'CONFIRM_RESET_PASSWORD_WITH_CODE') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmResetScreen(
              data: LoginData(name: email, password: ' '),
            ),
          ),
        );
      }
    } on AuthException catch (e) {
      return '${e.message} - ${e.recoverySuggestion}';
    }
    return '';
  }

  Future<String> _onSignup(LoginData data) async {
    try {
      Map<String, String> userAttributes = {
        'email': data.name,
      };
      SignUpResult res = await Amplify.Auth.signUp(
          username: data.name,
          password: data.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      _data = data;
      setState(() {
        _isSignUpComplete = res.isSignUpComplete;
      });
    } on AuthException catch (e) {
      return '${e.message} - ${e.recoverySuggestion}';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      logo: 'assets/iwel_logo_sm.png',
      onSignup: _onSignup,
      onLogin: _onLogin,
      onRecoverPassword: (String email) => _onRecoverPassword(context, email),
      theme: LoginTheme(
        primaryColor: Theme.of(context).primaryColor,
      ),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacementNamed(
            _isSignedIn ? '/mainTab' : '/confirm',
            arguments: _data);
      },
    );
  }
}
