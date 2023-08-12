import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/buttons/Move.dart';
class Intro1 extends StatefulWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
            flex: 6,
            child: const Image(
              image: AssetImage(
                'assets/lady.png',
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(30, 35, 18,  1),
              child: Text('Consult only with a doctor you trust',
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
                    Move(route: '/intro2',),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
