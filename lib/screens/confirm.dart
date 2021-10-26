import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:iwelcgm/models/ModelProvider.dart';

class ConfirmScreen extends StatefulWidget {
  late final LoginData data;

  ConfirmScreen({required this.data});

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final _controller = TextEditingController();
  bool _isEnabled = false;
  bool _isSignUpComplete = false;
  late AuthUser _user;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  void _verifyCode(BuildContext context, LoginData data, String code) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: data.name, confirmationCode: code);

      // await Amplify.Auth.signIn(username: data.name, password: data.password)
      //     .then((value) {
      setState(() async {
        _isSignUpComplete = res.isSignUpComplete;
        if (_isSignUpComplete) {
          await Amplify.Auth.signIn(
                  username: data.name, password: data.password)
              .then((_) async {
            await Future.wait([
              Amplify.Auth.getCurrentUser().then((user) {
                setState(() {
                  _user = user;
                });
              })
            ]);
            UserInfo newUserInfo = UserInfo(userId: _user.userId);
            try {
              await Amplify.DataStore.save(newUserInfo);
            } catch (e) {
              throw ('An error occurred while creating new UserInfo: $e');
            }
          });
          Navigator.pushReplacementNamed(context, '/devices');
        }
        // });
      });
    } on AuthException catch (e) {
      throw (e.message);
    }
    // try {
    //   final res = await Amplify.Auth.confirmSignUp(
    //       username: data.name, confirmationCode: code);
    //   if (res.isSignUpComplete) {
    //     // Sign user in
    //     await Amplify.Auth.signIn(username: data.name, password: data.password);
    //
    //     Navigator.pushReplacementNamed(context, '/dashboard');
    //   }
    // } on AuthException catch (e) {
    //   print(e.message);
    // }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                margin: const EdgeInsets.all(30),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 4.0),
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Enter confirmation code',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: _isEnabled
                            ? () {
                                _verifyCode(
                                    context, widget.data, _controller.text);
                              }
                            : null,
                        elevation: 4,
                        color: Theme.of(context).primaryColor,
                        disabledColor: Colors.teal.shade200,
                        child: Text(
                          'VERIFY',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text(
                          'Resend code',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
