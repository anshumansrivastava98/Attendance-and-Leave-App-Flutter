import 'package:attendance_app/widgets/apply_leave.dart';
import 'package:flutter/material.dart';

class ViewLeave extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;

  ViewLeave(this.text1, this.text2, this.text3);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                Text(text2),
                Text(text3),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ApplyLeave()),
                );
              },
              child: Text(
                'APPLY',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue[600]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
