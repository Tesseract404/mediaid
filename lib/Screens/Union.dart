import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff32c1e0),
        onTap: _onItemTapped,
      ),
    );
  }
}
