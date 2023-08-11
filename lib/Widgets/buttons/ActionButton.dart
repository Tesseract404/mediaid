import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final title;
  final String route;
  // final height;
  // final width;
  const ActionButton({Key? key, this.title, required this.route})
      : super(key: key);

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
            color: const Color(0xff32c1e0),
            borderRadius: BorderRadius.circular(32)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
