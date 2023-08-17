import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/ScheduleCard.dart';

import '../Model/Appointment.dart';
class Schedules extends StatefulWidget {

  const Schedules({Key? key}) : super(key: key);

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {

  @override
  Widget build(BuildContext context) {
   // final Appointment appointment = ModalRoute.of(context)!.settings.arguments as Appointment;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Schedule',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 25
                ),
              ),
            ),
            Icon(CupertinoIcons.bell,
            color: Colors.black87,size: 26,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ScheduleCard(image:'assets/doc2.png',name:'Dr. Marcus Horizon',exp:'(Chardiologist)',),
            ScheduleCard(image:'assets/doc1.png',name:'Dr. Alysa Hana',exp:'(Psychologist)',),
          ],
        ),
      ),
    );
  }
}
