import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ExpandCards extends StatefulWidget {
  final String title;

  ExpandCards(this.title);

  @override
  _ExpandCardsState createState() => _ExpandCardsState();
}

class _ExpandCardsState extends State<ExpandCards> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  // ignore: unused_field
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.blue,
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: EdgeInsets.only(top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
        child: ExpansionTile(
          
          iconColor: Colors.white,
          
          backgroundColor: Colors.blue,
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: <Widget>[
            Container(
              color: Colors.white,
              child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
