import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/diagnosis.dart';

import '../Widgets/buttons/backbutton.dart';
class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading:backbutton (),
        centerTitle: true,
        title: Row(
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0 , 20,  0),
                child: Text(
                  'Health Diagnosis'  ,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            diagnosis(icon: 'assets/pulse.png',title: 'Heart Rate', count: '215bpm',),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
              child: Divider(thickness:  1,),
            ),
            diagnosis(icon: 'assets/cal.png',title: 'Calories', count: '756cal',),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
              child: Divider(thickness:  1,),
            ),
            diagnosis(icon: 'assets/scale.png',title: 'Weight', count: '64kgs',),

          ],
        ),
      ),
    );
  }
}
