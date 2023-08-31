import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/DocIcons.dart';

import '../Model/doctorModel.dart';
import '../Services/DoctorList.dart';
import '../Widgets/buttons/backbutton.dart';
import '../Widgets/buttons/homebuttons.dart';
import '../Widgets/docCard.dart';

class FindDoctors extends StatefulWidget {
  const FindDoctors({Key? key}) : super(key: key);

  @override
  State<FindDoctors> createState() => _FindDoctorsState();
}

class _FindDoctorsState extends State<FindDoctors> {
  List<doctorModel> _doctorsList = DoctorList().doctorList;
  Random random = Random();
  int min = 1;
  int max = 6;
  late int randomNumber;
  @override
  void initState() {
    super.initState();
    randomNumber = min + random.nextInt(max - min + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading: const backbutton(),
        title: Row(
          children: const [
            Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text(
                  'Find Doctors',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                    color: const Color(0xFFfaf6f5),
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0,
                        spreadRadius: 0.5,
                      )
                    ]),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(19, 0, 10, 0),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            CupertinoIcons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Find Doctors...',
                          hintStyle: TextStyle(
                            fontSize: 16,
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
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 5),
              child: Text(
                'Catagory',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: const [
                      homebuttons(
                          title: 'General',
                          image: 'assets/steth.png',
                          route: '/doctors'),
                      homebuttons(
                          title: 'Lungs',
                          image: 'assets/lungs.png',
                          route: '/doctors'),
                      homebuttons(
                          title: 'Dentalist',
                          image: 'assets/teeth.png',
                          route: '/doctors'),
                      homebuttons(
                          title: 'Psychiatrist',
                          image: 'assets/brain.png',
                          route: '/doctors'),
                      homebuttons(
                          title: 'Covid-19',
                          image: 'assets/covid.png',
                          route: '/doctors'),
                      homebuttons(
                          title: 'Surgeon',
                          image: 'assets/syringe.png',
                          route: '/doctors'),
                      homebuttons(
                          title: 'Cardio',
                          image: 'assets/heartrate.png',
                          route: '/doctors'),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 5),
              child: Text(
                'Recommended Doctors',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            if (randomNumber < 7)
              docCard(
                  image: _doctorsList[randomNumber].image,
                  title: _doctorsList[randomNumber].title,
                  subtitle: _doctorsList[randomNumber].category)
            else
              docCard(
                  image: _doctorsList[6].image,
                  title: _doctorsList[6].title,
                  subtitle: _doctorsList[6].category),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 5),
              child: Text(
                'Your Recent Doctors',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Container(
                height: 150,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int index = 0; index < 6; index++)
                      DocIcons(
                        image: _doctorsList[index].image,
                        title: _doctorsList[index].title,
                        subtitle: _doctorsList[index].category,
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
