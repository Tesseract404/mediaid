import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/buttons/SCustomButton2.dart';
import 'package:mediaid1/Widgets/buttons/ScheduleButton.dart';

class ScheduleCard2 extends StatelessWidget {
  final int scheduleId;
  final String name;
  //final String image;
  final String category;
  final String time;
  final String date;
  final VoidCallback onDeletePressed;
  final VoidCallback onReschedulePressed;
  const ScheduleCard2({
    Key? key,
    required this.name,
    //required this.image,
    required this.category,
    required this.time,
    required this.date,
    required this.onDeletePressed,
    required this.onReschedulePressed, required this.scheduleId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: .5,
                      spreadRadius: 0.1,
                    )
                  ]),
              child: Column(
                children: [
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Hospital A',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    // trailing:
                    // Container(
                    //   height: 75,
                    //   width: 75,
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       image: DecorationImage(
                    //         image: AssetImage(
                    //           image,
                    //         ),
                    //       )),
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 20, 0, 0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.black54,
                          size: 22,
                        ),
                        Text(
                          '$date/08/2023',
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Icon(
                            CupertinoIcons.clock,
                            color: Colors.black54,
                            size: 22,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //   child: Text(
                        //     'Confirmed',
                        //     style: TextStyle(fontSize: 17, color: Colors.greenAccent),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  //buttons
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(14, 20, 10, 0),
                          child: ScheduleButton(title:'Cancel',height: 60, color: Colors.blueGrey.shade200,Tcolor: Colors.black54,function:onDeletePressed),
                          // SCustomButton2(
                          //   height: 60,
                          //   color: Colors.blueGrey.shade200,
                          //   Tcolor: Colors.black54,
                          //   title: 'Cancel',
                          //   name: name,
                          //   exp: category,
                          //   image: image,
                          // ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 20, 14, 0),
                          child: ScheduleButton(title:'Reschedule',height: 60, color: Color(0xff32c1e0),Tcolor: Colors.white,function:onReschedulePressed),
                          // SCustomButton2(
                          //   height: 60,
                          //   color: Color(0xff32c1e0),
                          //   Tcolor: Colors.white,
                          //   title: 'Reshedule',
                          //   name: name,
                          //   exp: category,
                          //   image: image,
                          // ),
                        )),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
