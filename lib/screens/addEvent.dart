import 'package:flutter/material.dart';
import 'package:iwelcgm/screens/bloodpressure.dart';
import 'package:iwelcgm/screens/carbs.dart';
import 'package:iwelcgm/screens/exercise.dart';
import 'package:iwelcgm/screens/fastactinginsulin.dart';
import 'package:iwelcgm/screens/longactinginsulin.dart';

class AddEventForm extends StatefulWidget {
  @override
  _AddEventFormState createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _saveTodo() async {
    // to be filled in a later step
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 110,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExerciseScreen()));
                    },
                    icon: Image.asset(
                      'assets/exercise.png',
                    ),
                  ),
                  IconButton(
                    iconSize: 110,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BloodPressureScreen()));
                    },
                    icon: Image.asset(
                      'assets/bloodpressure.png',
                    ),
                  ),
                  IconButton(
                    iconSize: 110,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CarbsScreen()));
                    },
                    icon: Image.asset(
                      'assets/carbs.png',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    iconSize: 120,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FastActingInsulinScreen()));
                    },
                    icon: Image.asset(
                      'assets/fastactingIns.png',
                    ),
                  ),
                  IconButton(
                    iconSize: 120,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LongActingInsulinScreen()));
                    },
                    icon: Image.asset(
                      'assets/longactingIns.png',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
