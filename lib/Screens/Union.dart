import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Screens/Medbot.dart';
import 'package:mediaid1/Screens/Messages.dart';
import 'package:mediaid1/Screens/Schedule.dart';

import 'Home.dart';
import 'Profile.dart';
class Union extends StatefulWidget {
  const Union({Key? key}) : super(key: key);

  @override
  State<Union> createState() => _UnionState();
}

class _UnionState extends State<Union> {
  int _selectedIndex =0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Messages(),
    Medbot(),
    Schedules(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline_rounded),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.smiley),
            label: 'ai',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
            label: 'Profile',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff32c1e0),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
