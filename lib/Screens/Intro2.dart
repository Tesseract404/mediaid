import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/buttons/Move.dart';
class Intro2 extends StatefulWidget {
  const Intro2({Key? key}) : super(key: key);

  @override
  State<Intro2> createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 25, 0),
            child: Text('Skip',
              style: TextStyle(
                  color: CupertinoColors.inactiveGray,
                  fontSize: 15
              ),
            ),
          ),
          SizedBox(height: 120,),
          const Image(
            image: AssetImage(
              'assets/calander.png',
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 80, 18,  1),
            child: Text('Book and appointment of Doctors now or schedule for the future at your convinience',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 29,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Move(route: '/intro3',),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
