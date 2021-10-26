import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/CarbEvent.dart';
import 'package:iwelcgm/widgets/date_picker_widget.dart';
import 'package:iwelcgm/widgets/time_picker_widget.dart';
import 'package:intl/intl.dart';

import 'events.dart';

class CarbsScreen extends StatefulWidget {
  const CarbsScreen({Key? key}) : super(key: key);

  static final String title = 'Date (Range) & Time';

  @override
  _CarbsScreenState createState() => _CarbsScreenState();
}

class _CarbsScreenState extends State<CarbsScreen> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String selectedDate =
      DateFormat('MM/dd/yyyy').format(DateTime.now()).toString();

  final initialHours = TimeOfDay.now().hour.toString().padLeft(2, '0');
  final initialMinutes = TimeOfDay.now().minute.toString().padLeft(2, '0');

  String selectedTime = '';

  final carbAmountController = TextEditingController();
  String carbAmount = '';
  final carbDescriptionController = TextEditingController();
  String carbDescription = '';

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
        title: Text('Carb Intake'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: carbAmountController,
              decoration: InputDecoration(
                hintText: 'Enter Carb Grams',
                labelText: 'Enter Carbs',
                labelStyle: TextStyle(fontSize: 18, color: Colors.teal),
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 4,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: carbDescriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
                labelText: 'Enter Description',
                labelStyle: TextStyle(fontSize: 18, color: Colors.teal),
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
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
                setState(() {
                  carbAmount = carbAmountController.text;
                  carbDescription = carbDescriptionController.text;
                });
                print('CARB AMOUNT: $carbAmount');
                print('CARB DESCRIPTION: $carbDescription');
                print('CARB DATE: $selectedDate');
                print('CARB TIME: $selectedTime');

                var user = _user!.userId;
                CarbEvent newCarbEvent = CarbEvent(
                    userId: user,
                    carbAmount: carbAmount,
                    carbDescription: carbDescription,
                    date: selectedDate,
                    time: selectedTime);

                try {
                  await Amplify.DataStore.save(newCarbEvent);
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
