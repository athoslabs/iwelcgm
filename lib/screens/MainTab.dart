import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:iwelcgm/screens/coaching.dart';
import 'package:iwelcgm/screens/dashboard.dart';
import 'package:iwelcgm/screens/events.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen(
      {Key? key, required this.cgmDeviceName, required this.device})
      : super(key: key);

  final String cgmDeviceName;
  final BluetoothDevice device;

  @override
  _MainTabScreenState createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardScreen(
        cgmDeviceName: widget.cgmDeviceName,
        device: widget.device,
      ),
      EventsScreen(),
      CoachingScreen()
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey.shade500,
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ballot),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Coaching',
          ),
        ],
      ),
    );
  }
}
