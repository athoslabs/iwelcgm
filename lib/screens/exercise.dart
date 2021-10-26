import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/ExerciseEvent.dart';
import 'package:iwelcgm/screens/events.dart';
import 'package:iwelcgm/widgets/date_picker_widget.dart';
import 'package:iwelcgm/widgets/time_picker_widget.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  static final String title = 'Date (Range) & Time';

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  List<String> intensityLevels = <String>[
    'Low Intensity',
    'Moderate Intensity',
    'High Intensity'
  ];
  String intensityValue = 'Low Intensity';

  List<String> activityDurations = <String>[
    '15 min',
    '30 min',
    '45 min',
    '1 hour',
    '1hr, 15 min',
    '1hr, 30 min',
    '1hr, 45 min',
    '2 hours',
  ];
  String durationValue = '15 min';
  String exerciseDescription = '';

  final descriptionController = TextEditingController();

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Activity'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  'Select Exercise Intensity',
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
                DropdownButton<String>(
                  onChanged: (String? newValue) {
                    setState(() {
                      intensityValue = newValue!;
                    });
                  },
                  value: intensityValue,
                  items: intensityLevels.map<DropdownMenuItem<String>>(
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
              height: 15,
            ),
            Column(
              children: [
                Text(
                  'Select Duration',
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
                DropdownButton<String>(
                  onChanged: (String? newValue) {
                    setState(() {
                      durationValue = newValue!;
                    });
                  },
                  value: durationValue,
                  items: activityDurations.map<DropdownMenuItem<String>>(
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
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: descriptionController,
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
              ],
            ),
            SizedBox(
              height: 35,
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () async {
                setState(() {
                  exerciseDescription = descriptionController.text;
                });
                print('EXERCISE INTENSITY: $intensityValue');
                print('EXERCISE DURATION: $durationValue');
                print('EXERCISE DESCRIPTION: $exerciseDescription');
                var user = _user!.userId;
                ExerciseEvent newExerciseEvent = ExerciseEvent(
                    userId: user,
                    intensity: intensityValue,
                    duration: durationValue,
                    description: exerciseDescription);

                try {
                  await Amplify.DataStore.save(newExerciseEvent);
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
}
