import 'package:flutter/material.dart';

import '../../Screens/DocProfile.dart';

class ScheduleButton extends StatelessWidget {
  final VoidCallback function;
  final Color color;
  final Color Tcolor;
  final title;
  final double height;
  const ScheduleButton(
      {Key? key,
        required this.height,
        required this.color,
        required this.Tcolor,
        required this.function,
        this.title
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Tcolor,
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
