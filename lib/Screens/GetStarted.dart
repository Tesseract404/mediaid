import 'package:flutter/material.dart';

import '../Widgets/buttons/ActionButton.dart';
import '../Widgets/buttons/ActionButton2.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  const [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Image(image: AssetImage('assets/logo2.png')),
          ),
          Text(
            "Let's get started!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 12, 25, 0),
            child: Text(
              "Login to enjoy the feature we've provided and healthy!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w400,
                color: Colors.grey
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: ActionButton(title: 'Login' ,route: '/login',),
          ),
          SizedBox(height: 12,),
          ActionButton2(title: 'SignUp' ,route: '/signup',),
        ],
      ),
    );
  }
}
