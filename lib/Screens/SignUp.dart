import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/buttons/ActionButton.dart';
import 'package:mediaid1/Widgets/buttons/backbutton.dart';
import 'package:mediaid1/Widgets/formFields.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const backbutton(),
        centerTitle: true,
        title: Text(
          'Sign Up',
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
              height: 40,
            ),
            formFields(
              title: "Enter your name",
              logo: CupertinoIcons.person,
            ),
            SizedBox(
              height: 15,
            ),
            formFields(
              title: "Enter your email",
              logo: CupertinoIcons.mail,
            ),
            SizedBox(
              height: 15,
            ),
            formFields(title: "Enter your password", logo: CupertinoIcons.lock),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 40, 0),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xff32c1e0),
                    value: this.value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  Text(
                    'I agree to the Medi-Aid Terms of Service and Privacy Policy',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context)=> AlertDialog(
                  content: Container(
                    height: 350,
                    width: 30,
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFfaf6f5),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 60,
                            color: Color(0xff32c1e0),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('Success',style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800
                        ),),
                        SizedBox(height: 20,),
                        Text('Your account has been successfully registered',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: CupertinoColors.inactiveGray
                        ),),
                        SizedBox(height: 80,),
                        ActionButton(title:'Login',route: '/login')
                      ],
                    ),
                  ),
                ));
              },
              child: Container(
                height:62,
                width: 265,
                decoration: BoxDecoration(
                    color: const Color(0xff32c1e0),
                    borderRadius: BorderRadius.circular(32)),
                child: Center(
                  child: Text(
                   'Sign Up',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Already have an account? Login")
          ],
        ),
      ),
    );
  }
}
