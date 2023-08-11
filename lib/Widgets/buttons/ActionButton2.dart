import 'package:flutter/material.dart';
class ActionButton2 extends StatelessWidget {
  final title;
  final route;
  const ActionButton2({Key? key, this.title, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        height:62,
        width: 265,
        decoration: BoxDecoration(
            border: Border.all(
              color:  const Color(0xff32c1e0),
              width: 2
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(32)),

        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: const Color(0xff32c1e0),
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
