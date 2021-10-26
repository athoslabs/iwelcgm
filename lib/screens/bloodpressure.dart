import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/BloodPressureEvent.dart';
import 'package:iwelcgm/widgets/date_picker_widget.dart';
import 'package:iwelcgm/widgets/time_picker_widget.dart';
import 'package:intl/intl.dart';

import 'events.dart';

class BloodPressureScreen extends StatefulWidget {
  const BloodPressureScreen({Key? key}) : super(key: key);

  static final String title = 'Date (Range) & Time';

  @override
  _BloodPressureScreenState createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<BloodPressureScreen> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String selectedDate =
      DateFormat('MM/dd/yyyy').format(DateTime.now()).toString();

  final initialHours = TimeOfDay.now().hour.toString().padLeft(2, '0');
  final initialMinutes = TimeOfDay.now().minute.toString().padLeft(2, '0');

  String selectedTime = '';

  final topNumberController = TextEditingController();
  String topNumber = '';
  final bottomNumberController = TextEditingController();
  String bottomNumber = '';

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
        title: Text('Blood Pressure'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              Container(
                width: 100,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: '000',
                          hintStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 35,
                          ),
                          border: InputBorder.none),
                      keyboardType: TextInputType.number,
                      controller: topNumberController,
                    ),
                    Divider(
                      height: 1,
                      thickness: 2,
                      color: Colors.teal,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: '000',
                          hintStyle:
                              TextStyle(color: Colors.teal, fontSize: 35),
                          border: InputBorder.none),
                      keyboardType: TextInputType.number,
                      controller: bottomNumberController,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Select date and time blood pressure reading was taken',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 24,
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
              ElevatedButton(
                child: Text('Save'),
                onPressed: () async {
                  setState(() {
                    topNumber = topNumberController.text;
                    bottomNumber = bottomNumberController.text;
                  });
                  print('BP TOP NUMBER: $topNumber');
                  print('BP BOTTOM NUMBER: $bottomNumber');
                  print('BP DATE: $selectedDate');
                  print('BP TIME: $selectedTime');
                  var user = _user!.userId;
                  BloodPressureEvent newBPEvent = BloodPressureEvent(
                      userId: user,
                      topNumber: topNumber,
                      bottomNumber: bottomNumber,
                      date: selectedDate,
                      time: selectedTime);

                  try {
                    await Amplify.DataStore.save(newBPEvent);
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
