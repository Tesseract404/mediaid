import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/diagnosisSmaller.dart';
import '../Services/UserDataService.dart';
import '../Model/userdata.dart';
import '../Widgets/buttons/ActionButtonSmall.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int userId = -1;
  String name = ' ';
  String email = ' ';
  userdata? userData;
  final userDataService = UserDataService();
  @override
  void initState() {
    super.initState();
    userDataService.getUserId().then((id) {
      setState(() {
        userId = id;
      });
      if (userId != -1) {
        userDataService.fetchUserData(userId).then((data) {
          if (data != null) {
            setState(() {
              userData = data;
              name = data.name;
              email = data.email;
            });
          }
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Container(
            height: 900,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff32B1E0),
                Color(0xff32c1e0),
                Color(0xff8FF4F2),
                Color(0xff8FF4F2),
                Color(0xff8FF4F2),
                Color(0xff8FF4F2),
              ],
            )),
          ),
          Positioned(
              top: 60,
              right: 100,
              left: 100,
              child: Column(
                children:   [
                  Icon(
                    CupertinoIcons.person_crop_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10,),
                  Text('$name',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.white
                  ),),
                  Text('$email',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xff4b8099)
                  ),),
                ],
              )),
          Positioned(
            top: 200,
            right: 20,
            left: 20,
            child:
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10 ),
            child: Row(
              children: [
                Expanded(child: diagnosisSmaller (icon: 'assets/pulse.png',title: 'Heart Rate', count: '215bpm',)),
                Expanded(child: diagnosisSmaller(icon: 'assets/cal.png',title: 'Calories', count: '756cal',)),
                Expanded(child: diagnosisSmaller(icon: 'assets/scale.png',title: 'Weight', count: '64kgs',)),
              ],
            ),
          ), ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 400,
              width: 410,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/health');
                    },
                    leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffCEECEC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: Icon(
                            CupertinoIcons.heart,
                            color: Color(0xff32c1e0),
                          ),
                        )),
                    title: Text(
                      'My Health',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(CupertinoIcons.forward),
                  ),
                  Divider(
                    thickness: 0.8,
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/schedule');
                    },
                    leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffCEECEC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: Icon(
                            CupertinoIcons.calendar,
                            color: Color(0xff32c1e0),
                          ),
                        )),
                    title: Text(
                      'Appointment',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(CupertinoIcons.forward),
                  ),
                  Divider(
                    thickness: 0.8,
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/presc');
                    },
                    leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffCEECEC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: Icon(
                            Icons.sticky_note_2,
                            color: Color(0xff32c1e0),
                          ),
                        )),
                    title: Text(
                      'Add Prescription',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(CupertinoIcons.forward),
                  ),
                  Divider(
                    thickness: 0.8,
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/records');
                    },
                    leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffCEECEC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: Icon(
                            Icons.history,
                            color: Color(0xff32c1e0),
                          ),
                        )),
                    title: Text(
                      'Medical Records',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(CupertinoIcons.forward),
                  ),
                  Divider(
                    thickness: 0.8,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: (context)=> AlertDialog(
                        content: SizedBox(
                          height: 350,
                          width: 30,
                          child: Column(
                            children: [
                              Expanded( flex:4,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFfaf6f5),
                                  ),
                                  child: const Icon(
                                    Icons.logout,
                                    size: 60,
                                    color: Color(0xff32c1e0),
                                  ),
                                ),
                              ),
                              Expanded(flex:2 ,
                                child: Text ('Are u sure you want to log out?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w800
                                ),),
                              ),
                               Expanded(flex:2,child: ActionButtonSmall(title:'Log Out',route: '/getstart', color:Colors.black12 )),
                               Expanded(flex:2,child: ActionButtonSmall(title:'Cancel',route: '', color:Color(0xff32c1e0), )),
                            ],
                          ),
                        ),
                      ));
                    },
                    child: ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: Icon(
                              Icons.logout,
                              color: Colors.redAccent,
                            ),
                          )),
                      title: Text(
                        'Log out',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.redAccent),
                      ),
                      trailing: Icon(CupertinoIcons.forward),
                    ),
                  ),
                  Divider(
                    thickness: 0.8,
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
