import 'package:flutter/material.dart';

import '../Widgets/buttons/backbutton.dart';
import '../Widgets/docCard.dart';
import '../Widgets/docCard2.dart';
class Hospitals extends StatefulWidget {
  const Hospitals({Key? key}) : super(key: key);

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading:backbutton (),
        title: Row(
          children: [
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0 , 20,  0),
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
            Expanded(
              child: Icon(Icons.more_vert_rounded,
                color: Colors.black38,
                size: 25,),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            docCard2(image: 'assets/doc3.png',title: 'Dr. Diandra',subtitle: 'Psychologist',hospital: 'Popular Hospital'),
            docCard2(image: 'assets/doc1.png',title: 'Dr. Stefi hezel',subtitle: 'Chardiologist',hospital: 'Square Hospital',),
            docCard2(image: 'assets/doc4.png',title: 'Dr. Gerty Cori',subtitle: 'Chardiologist',hospital: 'Ibn Cena Hospital'),
            docCard2(image: 'assets/doc2.png',title: 'Dr. Marcus Horizon',subtitle: 'Orthopedist',hospital: 'LabAid Hospital'),

          ],
        ),
      ),
    );
  }
}
