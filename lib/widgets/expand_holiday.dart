import 'package:flutter/material.dart';
import '../assests/view_holiday.dart';

class ExpandHoliday extends StatefulWidget {
  final String title;

  ExpandHoliday(this.title);

  @override
  _ExpandHolidayState createState() => _ExpandHolidayState();
}

class _ExpandHolidayState extends State<ExpandHoliday> {
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
          //childrenPadding: EdgeInsets.only(bottom: 10.0),
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
            SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ViewHoliday(
                      '15th August | Sun',
                      'Independence Day',
                    ),
                    Divider(
                      height: 2.0,
                      color: Colors.grey,
                    ),
                    ViewHoliday(
                      '10th September | Fri',
                      'Ganesh Chaturthi',
                    ),
                    Divider(
                      height: 2.0,
                      color: Colors.grey,
                    ),
                    ViewHoliday(
                      '2ns October | Sat',
                      'Gandhi Jayanti',
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(18, 10, 15, 10),
                      child: Text(
                        'See All Holidays',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
