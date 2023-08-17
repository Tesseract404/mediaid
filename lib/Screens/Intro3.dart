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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(
        flex: 1,
        child:  Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 25, 0),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/getstart');
              },
              child: Text('Skip',
                style: TextStyle(
                    color: CupertinoColors.inactiveGray,
                    fontSize: 15
                ),
              ),
            ),
          ),
        ),
      ),
        // SizedBox(height: 20,),
        Expanded(
          flex: 6,
          child: Align(
            alignment: Alignment.center,
            child: const Image(
              image: AssetImage(
                'assets/men.png',
              ),
            ),
          ),
        ),
          Expanded(
            flex: 2,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(30, 35, 18,  1),
              child: Text('Get connect our Online Consultation',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 29,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                  child: Move(route: '/getstart',),
                ),
              )),
        ],
      ),
    );
  }
}
