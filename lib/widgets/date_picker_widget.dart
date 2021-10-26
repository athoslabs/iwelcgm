import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'button_widget.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime date = DateTime.now();

  String selectedDate = '';

  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      selectedDate = DateFormat('MM/dd/yyyy').format(date).toString();
      return selectedDate;
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Date',
        text: getText(),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => {date = newDate});
  }
}
