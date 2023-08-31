import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/buttons/ActionButton.dart';
import 'package:mediaid1/Widgets/buttons/backbutton.dart';
import 'package:mediaid1/Widgets/formFields.dart';

import '../Services/Api_Constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool value = false;
  bool confirm = false;
  TextEditingController _emailcontroller= TextEditingController();
  TextEditingController _namecontroller= TextEditingController();
  TextEditingController _passwordcontroller= TextEditingController();
  Future Register()async{
    if(_emailcontroller.text.isEmpty || _passwordcontroller.text.isEmpty || _namecontroller.text.isEmpty){
      Fluttertoast.showToast(msg: "Please fill all the fields!");
    }
    else
      {
        var  url = Uri.parse('$BASE_URL/signup.php');
        var response = await http.post(url,
            body: {
          "name"  : _namecontroller.text,
          "email" : _emailcontroller.text,
          "password" : _passwordcontroller.text,
        });
        var data = json.decode(response.body);
        if(data['query1'] == "success"){
          //&&data['query2'] == "success"
          //print('reached');
          //confirm = true;
          Fluttertoast.showToast(msg: "Successfully Registered");
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
          )
          );
          //Navigator.pushNamed(context, '/login');
        }else{
          Fluttertoast.showToast(msg: "Registration Failed!");
        }
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const backbutton(),
        centerTitle: true,
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            formFields(
              title: "Enter your name",
              logo: CupertinoIcons.person, controller: _namecontroller, obs: false,
            ),
            SizedBox(
              height: 15,
            ),
             formFields(
              title: "Enter your email",
              logo: CupertinoIcons.mail, controller: _emailcontroller, obs: false,
            ),
            const SizedBox(
              height: 15,
            ),
            formFields(title: "Enter your password", logo: CupertinoIcons.lock, controller: _passwordcontroller, obs: true,),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     //crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Checkbox(
            //         activeColor: Color(0xff32c1e0),
            //         value: this.value,
            //         onChanged: (value) {
            //           setState(() {
            //             this.value = value!;
            //           });
            //         },
            //       ),
            //       Text(
            //         'I agree to the Medi-Aid Terms of Service and Privacy Policy',
            //         style: TextStyle(
            //           fontSize: 11,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Register();
                print('clicked');
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(" Login",
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
