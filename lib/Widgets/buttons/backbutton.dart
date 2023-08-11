import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class backbutton extends StatelessWidget {
  const backbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(
        CupertinoIcons.chevron_back,
        color: Colors.black87,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
