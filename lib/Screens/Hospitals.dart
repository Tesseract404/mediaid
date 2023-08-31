import 'dart:math';

import 'package:flutter/material.dart';

import '../Model/doctorModel.dart';
import '../Services/DoctorList.dart';
import '../Widgets/buttons/backbutton.dart';
import '../Widgets/docCard.dart';
import '../Widgets/docCard2.dart';
class Hospitals extends StatefulWidget {
  const Hospitals({Key? key}) : super(key: key);

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  final List<doctorModel> _doctorsList = DoctorList().doctorList;
  List<String> hospital = ['Popular Hospital', 'Square Hospital', 'LabAid', 'Lubana', 'Ibn Cena','Dhaka Medical','EverCare','Apollo'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading:backbutton (),
        title: Row(
          children: const [
            Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0 , 20,  0),
                child: Text(
                  'Hospitals'  ,
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            for (int index = 0; index < _doctorsList.length; index++)
              docCard2(
                image:  _doctorsList[index].image,
                title: _doctorsList[index].title,
                subtitle: _doctorsList[index].category,
                hospital: hospital,
              )

          ],
        ),
      ),
    );
  }
}
