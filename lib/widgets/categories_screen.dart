import 'package:attendance_app/widgets/expand_holiday.dart';
import 'package:flutter/material.dart';
import './category_item.dart';
import 'expand_calendar.dart';
import './expand_leave.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Leave & Attendance'),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CategoryItem("Absent Days For Current & Last Month", Colors.red,
                    "1", Icons.ac_unit),
                CategoryItem("Leave & Regularization history", Colors.blue, "2",
                    Icons.access_alarm_outlined),
                CategoryItem("Time report - Team", Colors.blue, "3",
                    Icons.accessibility_sharp),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ExpandCards('My Calender'),
            ExpandLeave('Apply Leave'),
            ExpandHoliday('Holiday Calender'),
          ],
        ),
      ),
    );
  }
}
