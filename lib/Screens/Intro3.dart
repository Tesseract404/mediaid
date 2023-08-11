import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/buttons/Move.dart';
class Intro3 extends StatefulWidget {
  const Intro3({Key? key}) : super(key: key);

  @override
  State<Intro3> createState() => _Intro3State();
}

class _Intro3State extends State<Intro3> {
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
          SizedBox(height: 20,),
          const Image(
            image: AssetImage(
              'assets/men.png',
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 35, 18,  1),
            child: Text('Get connect our Online Consultation',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 32,
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
                    child: Move(route: '/getstart',),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
