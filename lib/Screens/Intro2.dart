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
          Expanded(
            flex: 1,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 25, 0),
              child: Text('Skip',
                style: TextStyle(
                    color: CupertinoColors.inactiveGray,
                    fontSize: 15
                ),
              ),
            ),
          ),
          // SizedBox(height: 20,),
          Expanded(
            flex: 5,
            child: const Image(
              image: AssetImage(
                'assets/calander.png',
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(30, 35, 18,  1),
              child: Text('Book and appointment of Doctors now or schedule for the future at your convinience',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 29,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Move(route: '/intro3',),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
