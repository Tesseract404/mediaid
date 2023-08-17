import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/PresCard.dart';

import '../Widgets/buttons/backbutton.dart';
class Prescription extends StatefulWidget {
  const Prescription({Key? key}) : super(key: key);

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading:backbutton (),
        title: Row(
          children: const [
            Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0 , 20,  0),
                child: Text(
                  'Prescription'  ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Colors.black
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                  color: const Color(0xFFfaf6f5),
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: const [BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    spreadRadius: 0.5,
                  )]
              ),
              child:   Padding(
                padding: const EdgeInsets.fromLTRB(19, 5, 10, 0),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(CupertinoIcons.search,
                      color: Colors.grey,),
                    hintText: 'Find prescription',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    focusColor: Colors.transparent,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black45,
                  cursorHeight: 25,
                  cursorWidth: 1,
                ),
              ),
            ),
          ),
          PresCard(image: 'assets/pres.png',title: 'Dr. Murcus Horizon',subtitle: 'Chardiologist',route: '',details: 'Cardiac Arrest',),
          PresCard(image: 'assets/eco.png',title: 'Dr. Murcus Horizon',subtitle: 'Chardiologist',route: '',details: 'Echocardiogram',),
        ],
      ),
    );
  }
}
