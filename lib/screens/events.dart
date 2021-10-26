import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:iwelcgm/models/BloodPressureEvent.dart';
import 'package:iwelcgm/models/CarbEvent.dart';
import 'package:iwelcgm/models/ExerciseEvent.dart';
import 'package:iwelcgm/models/FastActingInsEvent.dart';
import 'package:iwelcgm/models/LongActingInsEvent.dart';
import 'package:iwelcgm/screens/addEvent.dart';
import '../globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events',
      home: EventsScreen(),
    );
  }
}

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  late StreamSubscription _exerciseSubscription;
  late StreamSubscription _carbSubscription;
  late StreamSubscription _bloodPressureSubscription;
  late StreamSubscription _fastActingInsulinSubscription;
  late StreamSubscription _longActingInsulinSubscription;

  final items = [
    'Exercise',
    'Carbs',
    'Blood Pressure',
    'Fast-Acting Insulin',
    'Long-Acting Insulin'
  ];
  String? itemValue;

  bool _isLoading = true;

  List<ExerciseEvent> _exerciseEvents = [];
  List<CarbEvent> _carbEvents = [];
  List<BloodPressureEvent> _bloodPressureEvents = [];
  List<FastActingInsEvent> _fastActingInsulinEvents = [];
  List<LongActingInsEvent> _longActingInsulinEvents = [];

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
    _initializeApp();
    super.initState();
  }

  @override
  void dispose() {
    _exerciseSubscription.cancel();
    _carbSubscription.cancel();
    _bloodPressureSubscription.cancel();
    _fastActingInsulinSubscription.cancel();
    _longActingInsulinSubscription.cancel();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    //await _configureAmplify();

    // listen for updates to Todo entries by passing the Todo classType to
    // Amplify.DataStore.observe() and when an update event occurs, fetch the
    // todo list
    //
    // note this strategy may not scale well with larger number of entries
    _exerciseSubscription =
        Amplify.DataStore.observe(ExerciseEvent.classType).listen((event) {
      _fetchEvents();
    });

    _carbSubscription =
        Amplify.DataStore.observe(CarbEvent.classType).listen((event) {
      _fetchEvents();
    });

    _bloodPressureSubscription =
        Amplify.DataStore.observe(BloodPressureEvent.classType).listen((event) {
      _fetchEvents();
    });

    _fastActingInsulinSubscription =
        Amplify.DataStore.observe(FastActingInsEvent.classType).listen((event) {
      _fetchEvents();
    });

    _longActingInsulinSubscription =
        Amplify.DataStore.observe(LongActingInsEvent.classType).listen((event) {
      _fetchEvents();
    });

    // fetch Todo entries from DataStore
    await _fetchEvents();

    // after both configuring Amplify and fetching Todo entries, update loading
    // ui state to loaded state
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _configureAmplify() async {
    // to be filled in a later step
  }

  Future<void> _fetchEvents() async {
    try {
      // query for all Todo entries by passing the Todo classType to
      // Amplify.DataStore.query()
      List<ExerciseEvent> updatedExerciseEvents = await Amplify.DataStore.query(
        ExerciseEvent.classType,
        where: ExerciseEvent.USERID.eq(_user!.userId),
      );

      List<CarbEvent> updatedCarbEvents = await Amplify.DataStore.query(
          CarbEvent.classType,
          where: CarbEvent.USERID.eq(_user!.userId),
          sortBy: [CarbEvent.DATE.descending()]);

      List<BloodPressureEvent> updatedBloodPressureEvents =
          await Amplify.DataStore.query(BloodPressureEvent.classType,
              where: BloodPressureEvent.USERID.eq(_user!.userId),
              sortBy: [BloodPressureEvent.DATE.descending()]);

      List<FastActingInsEvent> updatedFastActingInsEvents =
          await Amplify.DataStore.query(FastActingInsEvent.classType,
              where: FastActingInsEvent.USERID.eq(_user!.userId),
              sortBy: [FastActingInsEvent.DATE.descending()]);

      List<LongActingInsEvent> updatedLongActingInsEvents =
          await Amplify.DataStore.query(LongActingInsEvent.classType,
              where: LongActingInsEvent.USERID.eq(_user!.userId),
              sortBy: [LongActingInsEvent.DATE.descending()]);

      // update the ui state to reflect fetched todos
      setState(() {
        _exerciseEvents = updatedExerciseEvents;
        _carbEvents = updatedCarbEvents;
        _bloodPressureEvents = updatedBloodPressureEvents;
        _fastActingInsulinEvents = updatedFastActingInsEvents;
        _longActingInsulinEvents = updatedLongActingInsEvents;
      });
    } catch (e) {
      print('An error occurred while querying Todos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Events'),
          backgroundColor: Colors.teal,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Exercise',
              ),
              Tab(
                text: 'Carbs',
              ),
              Tab(
                text: 'Blood Pressure',
              ),
              Tab(
                text: 'FA Insulin',
              ),
              Tab(
                text: 'LA Insulin',
              )
            ],
          ),
        ),
        // body: Center(
        //     child: CircularProgressIndicator(
        //   color: Colors.teal,
        // )),
        body: TabBarView(
          children: [
            Expanded(
                child: ExerciseEventsList(exerciseEvents: _exerciseEvents)),
            Expanded(child: CarbEventsList(carbEvents: _carbEvents)),
            Expanded(
                child: BloodPressureEventsList(
                    bloodPressureEvents: _bloodPressureEvents)),
            Expanded(
                child: FastActingInsEventsList(
                    fastActingInsEvents: _fastActingInsulinEvents)),
            Expanded(
                child: LongActingInsEventsList(
                    longActingInsEvents: _longActingInsulinEvents)),
          ],
        ),

        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEventForm()));
          },
          tooltip: 'Add Event',
          label: Row(
            children: [Icon(Icons.add), Text('Add Event')],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      );
}

class LongActingInsEventsList extends StatefulWidget {
  final List<LongActingInsEvent> longActingInsEvents;

  LongActingInsEventsList({required this.longActingInsEvents});

  @override
  _LongActingInsEventsListState createState() =>
      _LongActingInsEventsListState();
}

class _LongActingInsEventsListState extends State<LongActingInsEventsList> {
  @override
  Widget build(BuildContext context) {
    if (widget.longActingInsEvents.length >= 1) {
      return ListView(
          padding: EdgeInsets.all(8),
          children: widget.longActingInsEvents
              .map((longActingInsEvent) => LongActingInsEventItem(
                  longActingInsEvent: longActingInsEvent))
              .toList());
    } else {
      return Center(
          child: Text('Tap button below to add Long-Acting Insulin Event!'));
    }
  }
}

class FastActingInsEventsList extends StatefulWidget {
  final List<FastActingInsEvent> fastActingInsEvents;

  FastActingInsEventsList({required this.fastActingInsEvents});

  @override
  _FastActingInsEventsListState createState() =>
      _FastActingInsEventsListState();
}

class _FastActingInsEventsListState extends State<FastActingInsEventsList> {
  @override
  Widget build(BuildContext context) {
    if (widget.fastActingInsEvents.length >= 1) {
      return ListView(
          padding: EdgeInsets.all(8),
          children: widget.fastActingInsEvents
              .map((fastActingInsEvent) => FastActingInsEventItem(
                  fastActingInsEvent: fastActingInsEvent))
              .toList());
    } else {
      return Center(
          child: Text('Tap button below to add Fast-Acting Insulin Event!'));
    }
  }
}

class BloodPressureEventsList extends StatefulWidget {
  final List<BloodPressureEvent> bloodPressureEvents;

  BloodPressureEventsList({required this.bloodPressureEvents});

  @override
  _BloodPressureEventsListState createState() =>
      _BloodPressureEventsListState();
}

class _BloodPressureEventsListState extends State<BloodPressureEventsList> {
  @override
  Widget build(BuildContext context) {
    if (widget.bloodPressureEvents.length >= 1) {
      return ListView(
          padding: EdgeInsets.all(8),
          children: widget.bloodPressureEvents
              .map((bloodPressureEvent) => BloodPressureEventItem(
                  bloodPressureEvent: bloodPressureEvent))
              .toList());
    } else {
      return Center(
          child: Text('Tap button below to add Blood Pressure Reading!'));
    }
  }
}

class CarbEventsList extends StatefulWidget {
  final List<CarbEvent> carbEvents;

  CarbEventsList({required this.carbEvents});

  @override
  _CarbEventsListState createState() => _CarbEventsListState();
}

class _CarbEventsListState extends State<CarbEventsList> {
  @override
  Widget build(BuildContext context) {
    if (widget.carbEvents.length >= 1) {
      return ListView(
          padding: EdgeInsets.all(8),
          children: widget.carbEvents
              .map((carbEvent) => CarbEventItem(carbEvent: carbEvent))
              .toList());
    } else {
      return Center(child: Text('Tap button below to add Carb Information!'));
    }
  }
}

class ExerciseEventsList extends StatefulWidget {
  final List<ExerciseEvent> exerciseEvents;

  ExerciseEventsList({required this.exerciseEvents});

  @override
  _ExerciseEventsListState createState() => _ExerciseEventsListState();
}

class _ExerciseEventsListState extends State<ExerciseEventsList> {
  @override
  Widget build(BuildContext context) {
    if (widget.exerciseEvents.length >= 1) {
      return ListView(
          padding: EdgeInsets.all(8),
          children: widget.exerciseEvents
              .map((exerciseEvent) =>
                  ExerciseEventItem(exerciseEvent: exerciseEvent))
              .toList());
    } else {
      return Center(child: Text('Tap button below to add an Event!'));
    }
  }
}

class LongActingInsEventItem extends StatelessWidget {
  final double iconSize = 24.0;
  final LongActingInsEvent longActingInsEvent;

  LongActingInsEventItem({required this.longActingInsEvent});

  void _deleteLongActingInsEvent(BuildContext context) async {
    try {
      // to delete data from DataStore, we pass the model instance to
      // Amplify.DataStore.delete()
      await Amplify.DataStore.delete(longActingInsEvent);
    } catch (e) {
      print('An error occurred while deleting Long-Action Insulin Event: $e');
    }
  }

  Future<void> _toggleIsComplete() async {
    // to be filled in a later step
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _toggleIsComplete();
        },
        onLongPress: () {
          _deleteLongActingInsEvent(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ' + longActingInsEvent.insulinValue,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('Date: ' + longActingInsEvent.date),
                  Text('Time: ' + longActingInsEvent.time),
                ],
              ),
            ),
            // Icon(
            //     exerciseEvent.isComplete
            //         ? Icons.check_box
            //         : Icons.check_box_outline_blank,
            //     size: iconSize),
          ]),
        ),
      ),
    );
  }
}

class FastActingInsEventItem extends StatelessWidget {
  final double iconSize = 24.0;
  final FastActingInsEvent fastActingInsEvent;

  FastActingInsEventItem({required this.fastActingInsEvent});

  void _deleteFastActingInsEvent(BuildContext context) async {
    try {
      // to delete data from DataStore, we pass the model instance to
      // Amplify.DataStore.delete()
      await Amplify.DataStore.delete(fastActingInsEvent);
    } catch (e) {
      print('An error occurred while deleting Fast-Acting Insulin Event: $e');
    }
  }

  Future<void> _toggleIsComplete() async {
    // to be filled in a later step
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _toggleIsComplete();
        },
        onLongPress: () {
          _deleteFastActingInsEvent(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ' + fastActingInsEvent.insulinValue,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('Date: ' + fastActingInsEvent.date),
                  Text('Time: ' + fastActingInsEvent.time),
                ],
              ),
            ),
            // Icon(
            //     exerciseEvent.isComplete
            //         ? Icons.check_box
            //         : Icons.check_box_outline_blank,
            //     size: iconSize),
          ]),
        ),
      ),
    );
  }
}

class BloodPressureEventItem extends StatelessWidget {
  final double iconSize = 24.0;
  final BloodPressureEvent bloodPressureEvent;

  BloodPressureEventItem({required this.bloodPressureEvent});

  void _deleteBloodPressureEvent(BuildContext context) async {
    try {
      // to delete data from DataStore, we pass the model instance to
      // Amplify.DataStore.delete()
      await Amplify.DataStore.delete(bloodPressureEvent);
    } catch (e) {
      print('An error occurred while deleting Blood Pressure Event: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          //_toggleIsComplete();
        },
        onLongPress: () {
          _deleteBloodPressureEvent(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Systolic mm Hg: ' + bloodPressureEvent.topNumber,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('Diastolic mm Hg: ' + bloodPressureEvent.bottomNumber,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('Date: ' + bloodPressureEvent.date),
                  Text('Time: ' + bloodPressureEvent.time),
                ],
              ),
            ),
            // Icon(
            //     exerciseEvent.isComplete
            //         ? Icons.check_box
            //         : Icons.check_box_outline_blank,
            //     size: iconSize),
          ]),
        ),
      ),
    );
  }
}

class CarbEventItem extends StatelessWidget {
  final double iconSize = 24.0;
  final CarbEvent carbEvent;

  CarbEventItem({required this.carbEvent});

  void _deleteCarbEvent(BuildContext context) async {
    try {
      // to delete data from DataStore, we pass the model instance to
      // Amplify.DataStore.delete()
      await Amplify.DataStore.delete(carbEvent);
    } catch (e) {
      print('An error occurred while deleting Carb Event: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          //_toggleIsComplete();
        },
        onLongPress: () {
          _deleteCarbEvent(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: ' + carbEvent.carbDescription,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('Amount: ' + carbEvent.carbAmount),
                  Text('Date: ' + carbEvent.date),
                  Text('Time: ' + carbEvent.time),
                ],
              ),
            ),
            // Icon(
            //     exerciseEvent.isComplete
            //         ? Icons.check_box
            //         : Icons.check_box_outline_blank,
            //     size: iconSize),
          ]),
        ),
      ),
    );
  }
}

class ExerciseEventItem extends StatelessWidget {
  final double iconSize = 24.0;
  final ExerciseEvent exerciseEvent;

  ExerciseEventItem({required this.exerciseEvent});

  void _deleteExerciseEvent(BuildContext context) async {
    try {
      // to delete data from DataStore, we pass the model instance to
      // Amplify.DataStore.delete()
      await Amplify.DataStore.delete(exerciseEvent);
    } catch (e) {
      print('An error occurred while deleting Exercise Event: $e');
    }
  }

  Future<void> _toggleIsComplete() async {
    // to be filled in a later step
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _toggleIsComplete();
        },
        onLongPress: () {
          _deleteExerciseEvent(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: ' + exerciseEvent.description,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('Duration: ' + exerciseEvent.duration),
                  Text('Level: ' + exerciseEvent.intensity),
                ],
              ),
            ),
            // Icon(
            //     exerciseEvent.isComplete
            //         ? Icons.check_box
            //         : Icons.check_box_outline_blank,
            //     size: iconSize),
          ]),
        ),
      ),
    );
  }
}

class AddTodoForm extends StatefulWidget {
  @override
  _AddTodoFormState createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
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
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(filled: true, labelText: 'Name')),
              TextFormField(
                  controller: _descriptionController,
                  decoration:
                      InputDecoration(filled: true, labelText: 'Description')),
              ElevatedButton(onPressed: _saveTodo, child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
