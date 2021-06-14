import 'package:flutter/material.dart';

class ViewHoliday extends StatelessWidget {
  final String text1;
  final String text2;

  ViewHoliday(
    this.text1,
    this.text2,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.green,
            ),
          ),
          Text(text2),
        ],
      ),
    );
  }
}
