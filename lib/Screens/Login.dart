import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Screens/Union.dart';
import 'package:mediaid1/Widgets/buttons/ActionButton.dart';
import 'package:http/http.dart' as http;
import '../Model/doctorModel.dart';
import '../Model/userdata.dart';
import '../Services/Api_Constants.dart';
import '../Services/DoctorList.dart';
import '../Services/DoctorService.dart';
import '../Widgets/buttons/backbutton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Widgets/formFields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool user= true;

  List<doctorModel> _doctorsList = DoctorList().doctorList;
  List<doctorModel>? doctors=[];
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  Future login() async {
    if (_emailcontroller.text.isEmpty || _passwordcontroller.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all the fields!");
    } else {
      try{
        var url = Uri.parse('$BASE_URL/login.php');
        var response = await http.post(url, body: {
          "email": _emailcontroller.text,
          "password": _passwordcontroller.text,
        });
        final data = json.decode(response.body);
        if (data['query1'] == "success") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('user_id',data['query2'] );
          int userId = prefs.getInt('user_id') ?? -1;
          print(userId);
          setState(() async {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Union(index: 0 ),
              settings: RouteSettings(
                arguments: user, // Pass the bool value as an argument
              ),
            ),);

            Fluttertoast.showToast(
              msg: "Successfully logged in",
            );
          });
        }
      }catch(e){
        print(e);
       //Fluttertoast.showToast(msg: 'Invalid Credentials!');
      }
      if(_doctorsList.isEmpty){
        try{
          doctors = await DoctorService.fetchDoctors();
          print('Docs in the house !!!');
        }catch(e){
          print('error');
          print(e);
        }
      }
    }
  }
  Future loginDoctor() async {
    if (_emailcontroller.text.isEmpty || _passwordcontroller.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all the fields!");
    } else {
      try{
        var url = Uri.parse('$BASE_URL/logindoc.php');
        var response = await http.post(url, body: {
          "email": _emailcontroller.text,
          "password": _passwordcontroller.text,
        });
        final data = json.decode(response.body);
        if (data['query1'] == "success") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('user_id',data['query2'] );
          int userId = prefs.getInt('user_id') ?? -1;
          print(userId);
          setState(() async {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Union(index: 0 ),
              settings: RouteSettings(
                arguments: user, // Pass the bool value as an argument
              ),
            ),);

            Fluttertoast.showToast(
              msg: "Successfully logged in",
            );
          });
        }
      }catch(e){
        print(e);
        //Fluttertoast.showToast(msg: 'Invalid Credentials!');
      }
      if(_doctorsList.isEmpty){
        try{
          doctors = await DoctorService.fetchDoctors();
          print('Docs in the house !!!');
        }catch(e){
          print('error');
          print(e);
        }
      }
    }
  }
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title:   Text(
          user?'Login':'Doctor Login',
          style: const TextStyle(
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
              controller: _emailcontroller, obs: false,
            ),
            SizedBox(
              height: 15,
            ),
            formFields(
              title: "Enter your password",
              logo: CupertinoIcons.lock,
              controller: _passwordcontroller, obs: true,
            ),
            const SizedBox(
              height: 50,
            ),
            //ActionButton(title:'Login',route: '/union'),
            GestureDetector(
              onTap: ()async {
                if(user){
                  login();
                }else{
                  //login as doctor here
                  loginDoctor();
                }
              },
              child: Container(
                height: 62,
                width: 265,
                decoration: BoxDecoration(
                    color: user? Color(0xff32c1e0):Colors.deepPurpleAccent.shade100,
                    borderRadius: BorderRadius.circular(32)),
                child:   Center(
                  child: Text(
                    user?'Login':'Login as Doctor',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(user?"Don't have an account?":""),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child:   Text(
                    user?"SignUp":"",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff32c1e0),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child:  Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user?"Are u Doctor?":"Not a Doctor?"),
              GestureDetector(
                onTap: () {
                  //Navigator.pushNamed(context, '/signup');
                  setState(() {
                    if(user){
                      user = false;
                    }else{
                      user = true;
                    }
                    //buttontext= 'Login as Doctor';
                  });
                },
                child:   Text(
                  user?" Login as Doctor":"Login as User",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff32c1e0),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
