import 'package:flutter/material.dart';

class SupportContactScreen extends StatelessWidget {
  const SupportContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/iwel_logo_sm.png',
                  width: 100,
                  height: 100,
                )),
            Text('CONTINUOUS GLUCOSE MONITORING',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400)),
            SizedBox(
              height: 60,
            ),
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24,
            ),
            Text('Email:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('info@iwelhealth.com'),
            SizedBox(
              height: 24,
            ),
            Text('Phone:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('(610) 492-5710'),
            SizedBox(
              height: 24,
            ),
            Text('Website:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('https://iwelhealth.com/contact')
          ],
        ),
      ),
    );
  }
}
