import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/LongActingInsEvent.dart';
import 'package:iwelcgm/widgets/date_picker_widget.dart';
import 'package:iwelcgm/widgets/time_picker_widget.dart';
import 'package:intl/intl.dart';

import 'events.dart';

class LongActingInsulinScreen extends StatefulWidget {
  const LongActingInsulinScreen({Key? key}) : super(key: key);

  static final String title = 'Date (Range) & Time';

  @override
  _LongActingInsulinScreenState createState() =>
      _LongActingInsulinScreenState();
}

class _LongActingInsulinScreenState extends State<LongActingInsulinScreen> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String selectedDate =
      DateFormat('MM/dd/yyyy').format(DateTime.now()).toString();

  final initialHours = TimeOfDay.now().hour.toString().padLeft(2, '0');
  final initialMinutes = TimeOfDay.now().minute.toString().padLeft(2, '0');

  String selectedTime = '';

  String insulinValue = '1.0,u';

  List<String> insulinAmounts = <String>[
    '1.0,u',
    '2.0,u',
    '3.0,u',
    '4.0,u',
    '5.0,u',
    '6.0,u',
    '7.0,u',
    '8.0,u',
    '9.0,u',
    '10.0,u',
    '11.0,u',
    '12.0,u',
    '13.0,u',
    '14.0,u',
    '15.0,u',
    '16.0,u',
    '17.0,u',
    '18.0,u',
    '19.0,u',
    '20.0,u',
    '21.0,u',
    '22.0,u',
    '23.0,u',
    '24.0,u',
    '25.0,u',
    '26.0,u',
    '27.0,u',
    '28.0,u',
    '29.0,u',
    '30.0,u',
    '31.0,u',
    '32.0,u',
    '33.0,u',
    '34.0,u',
    '35.0,u',
    '36.0,u',
    '37.0,u',
    '38.0,u',
    '39.0,u',
    '40.0,u',
    '41.0,u',
    '42.0,u',
    '43.0,u',
    '44.0,u',
    '45.0,u',
    '46.0,u',
    '47.0,u',
    '48.0,u',
    '49.0,u',
    '50.0,u',
  ];

  AuthUser? _user;

  Future<void> _getUser() async {
    await Amplify.Auth.getCurrentUser().then((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  void initState() {
    _getUser();
    selectedTime = '$initialHours:$initialMinutes';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fast-Acting Insulin'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Select Fast-Acting Insulin Amount',
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
                DropdownButton<String>(
                  onChanged: (String? newValue) {
                    setState(() {
                      insulinValue = newValue!;
                    });
                  },
                  value: insulinValue,
                  items: insulinAmounts.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            // DatePickerWidget(),
            Text(
              'Select Date:',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(
                selectedDate == ' ' ? 'Select Date' : selectedDate,
                style: TextStyle(fontSize: 18, color: Colors.teal),
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            const SizedBox(height: 24),
            // TimePickerWidget(),
            Text(
              'Select Time:',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(
                selectedTime == ' ' ? 'Select Time' : selectedTime,
                style: TextStyle(fontSize: 18, color: Colors.teal),
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickTime,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () async {
                print('LONG-ACTING AMOUNT IS: $insulinValue');
                print('LONG-ACTING DATE: $selectedDate');
                print('LONG-ACTING TIME: $selectedTime');

                var user = _user!.userId;
                LongActingInsEvent newLongActingInsEvent = LongActingInsEvent(
                    userId: user,
                    insulinValue: insulinValue,
                    date: selectedDate,
                    time: selectedTime);

                try {
                  await Amplify.DataStore.save(newLongActingInsEvent);
                } catch (e) {
                  print('An error occurred while saving Device Reading: $e');
                }

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EventsScreen()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (date != null) {
      setState(() {
        selectedDate = DateFormat('MM/dd/yyyy').format(date).toString();
      });
    }
  }

  _pickTime() async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (newTime == null) return;

    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');

    setState(() => selectedTime = '$hours:$minutes');
  }
}
