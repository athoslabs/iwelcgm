import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:iwelcgm/screens/confirm.dart';
import 'package:iwelcgm/screens/devices.dart';
import 'package:iwelcgm/screens/entry.dart';
import 'package:iwelcgm/screens/confirm_reset.dart';
import 'package:iwelcgm/screens/dashboard.dart';
import 'package:iwelcgm/screens/events.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/events': (context) => EventsScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'iWel Monitor',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/confirm') {
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) =>
                  ConfirmScreen(data: settings.arguments as LoginData),
              transitionsBuilder: (_, __, ____, child) => child);
        }

        if (settings.name == '/confirm-reset') {
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) =>
                  ConfirmResetScreen(data: settings.arguments as LoginData),
              transitionsBuilder: (_, __, ____, child) => child);
        }

        if (settings.name == '/devices') {
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => DevicesScreen(),
              transitionsBuilder: (_, __, ____, child) => child);
        }

        return MaterialPageRoute(builder: (_) => EntryScreen());
      },
    );
  }
}
