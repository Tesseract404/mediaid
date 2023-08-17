import 'package:flutter/material.dart';
class CustActionButton extends StatelessWidget {
  final title;
  final String route;
  final double height;

  const CustActionButton({Key? key, this.title, required this.route, required this.height,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);

      },
      child: Container(
        height:height,
        decoration: BoxDecoration(
            color: const Color(0xff32c1e0),
            borderRadius: BorderRadius.circular(32)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
