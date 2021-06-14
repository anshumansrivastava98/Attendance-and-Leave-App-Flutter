import 'package:flutter/material.dart';
import '../assests/view_leave.dart';

class ExpandLeave extends StatefulWidget {
  final String title;

  ExpandLeave(this.title);

  @override
  _ExpandLeaveState createState() => _ExpandLeaveState();
}

class _ExpandLeaveState extends State<ExpandLeave> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.blue,
      margin: EdgeInsets.all(15),
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
            SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ViewLeave(
                      'CL/Contingency Leave',
                      '6.0 Remaining',
                      'Valid Till: 31/12/2021',
                    ),
                    Divider(
                      height: 2.0,
                      color: Colors.grey,
                    ),
                    ViewLeave(
                      'CL/Contingency Leave',
                      '6.0 Remaining',
                      'Valid Till: 31/12/2021',
                    ),
                    Divider(
                      height: 2.0,
                      color: Colors.grey,
                    ),
                    ViewLeave(
                      'CL/Contingency Leave',
                      '6.0 Remaining',
                      'Valid Till: 31/12/2021',
                    ),
                    Divider(
                      height: 2.0,
                      color: Colors.grey,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(25, 10, 15, 10),
                      child: Text(
                        'See More',
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
