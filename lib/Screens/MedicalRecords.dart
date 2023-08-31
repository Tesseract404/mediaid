import 'package:flutter/material.dart';

import '../Widgets/PresCard2.dart';

import '../Widgets/buttons/backbutton.dart';
import '../Widgets/docHomeCard.dart';
class MedicalRecords extends StatefulWidget {
  const MedicalRecords({Key? key}) : super(key: key);

  @override
  State<MedicalRecords> createState() => _MedicalRecordsState();
}

class _MedicalRecordsState extends State<MedicalRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading:const backbutton (),
        title: Row(
          children: const [
            Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0 , 20,  0),
                child: Text(
                  'Medical Records'  ,
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
           Padding(
             padding: const EdgeInsets.fromLTRB(22, 10, 0, 0),
             child: Text(
              'Doctors you have visited'  ,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black54
              ),
          ),
           ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Container(
              height: 200,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                  [
                    docHomeCard(image: '',title: 'Dr. Maria ELena',subtitle: 'Psychologist',rating: '4.4',distance: '1.2km away'),
                    docHomeCard(image: '',title: 'Dr. Marcus Horiz',subtitle: 'Chardiologist',rating: '4.7',distance: '800m away'),
                    docHomeCard(image: '',title: 'Dr. Marcus Horiz',subtitle: 'Chardiologist',rating: '4.7',distance: '800m away'),
                  ]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 10, 0, 0),
            child: Text(
              'Your Prescriptions'  ,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black54
              ),
            ),
          ),
          PresCard2(image: 'assets/pres.png',title: 'Dr. Murcus Horizon',category: 'Chardiologist',  details: 'Cardiac Arrest',  ),
          PresCard2(image: 'assets/eco.png',title: 'Dr. Murcus Horizon',category: 'Chardiologist',  details: 'Echocardiogram',  ),
        ],
      ),
    );
  }
}
