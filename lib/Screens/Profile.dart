import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Screens/Home.dart';

import '../Widgets/buttons/ActionButton.dart';
import '../Widgets/buttons/ActionButtonSmall.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Container(
            height: 900,
            decoration: BoxDecoration(
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
              top: 100,
              right: 100,
              left: 100,
              child: Column(
                children: [
                  const Icon(
                    CupertinoIcons.person_crop_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10,),
                  Text('Adam Lei',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.white
                  ),),
                  Text('adamlei@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.blueAccent
                  ),),
                ],
              )),
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
                      'History',
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
                        content: Container(
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
                               Expanded(flex:2,child: ActionButtonSmall(title:'Log Out',route: '/login', color:Colors.black12 )),
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
