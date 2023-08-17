import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/buttons/ActionButton.dart';

import '../Widgets/buttons/backbutton.dart';
import '../Widgets/formFields.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            formFields(
              title: "Enter your email",
              logo: CupertinoIcons.mail,
            ),
            SizedBox(
              height: 15,
            ),
            formFields(title: "Enter your password", logo: CupertinoIcons.lock),
            const SizedBox(
              height: 50,
            ),
            ActionButton(title:'Login',route: '/union'),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(" Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color:  Color(0xff32c1e0),
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
