

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/buttons/backbutton.dart';
import 'package:mediaid1/Widgets/docCard.dart';
class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
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
                  'Top Doctors'  ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
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
            docCard(image: 'assets/doc1.png',title: 'Dr. Stefi hezel',subtitle: 'Chardiologist',),
            docCard(image: 'assets/doc2.png',title: 'Dr. Marcus Horizon',subtitle: 'Orthopedist',),
            docCard(image: 'assets/doc3.png',title: 'Dr. Diandra',subtitle: 'Psychologist',),
            docCard(image: 'assets/doc4.png',title: 'Dr. Gerty Cori',subtitle: 'Chardiologist',),

          ],
        ),
      ),
    );
  }
}
