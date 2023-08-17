import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class insuranceDetailsRow extends StatelessWidget {
  final IconData icon;
  final title ;
  const insuranceDetailsRow({Key? key, required this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
          child: Icon(icon,
          color:  Color(0xff32c1e0),),
        ),
        Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          color: Color(0xff32c1e0),
        ),
        )
      ],
    );
  }
}
