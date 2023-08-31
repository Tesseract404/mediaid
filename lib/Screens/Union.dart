import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Screens/Medbot.dart';
import 'package:mediaid1/Screens/Messages.dart';
import 'package:mediaid1/Screens/Schedules.dart';

import 'Home.dart';
import 'Profile.dart';
class Union extends StatefulWidget {
  final int index;
    Union({Key? key, required this.index}) : super(key: key);
  @override
  State<Union> createState() => _UnionState();
}

class _UnionState extends State<Union> {
  late int _selectedIndex  ;
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
  void initState() {
    super.initState();
    _selectedIndex=widget.index;
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
            icon: Icon(Icons.attractions_rounded),
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
