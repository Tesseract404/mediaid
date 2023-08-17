import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/Timepick.dart';
import 'package:mediaid1/Widgets/buttons/CustActionButton.dart';

import '../Model/Appointment.dart';
import '../Widgets/DatePick.dart';
import '../Widgets/buttons/backbutton.dart';
import 'package:flutter/physics.dart';

class DocProfile extends StatefulWidget {
  final name;
  final String image;
  final spec;
  const DocProfile({Key? key, this.name, required this.image, this.spec}) : super(key: key);

  @override
  State<DocProfile> createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
  String selectedDate = '';
  String selectedTime = '';
  void _handleDateSelected(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _handleTimeSelected(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: backbutton(),
        title: Row(
          children: const [
            Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text(
                  'Doctor Details',
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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 125,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image(
                              image: AssetImage(
                                widget.image,
                              ),
                              height: 115,
                              width: 115,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              widget.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.spec,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xffD8FCEB),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xff38CC86),
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '4.7',
                                      style: TextStyle(
                                          color: Color(0xff38CC86),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  CupertinoIcons.location_solid,
                                  size: 18,
                                  color: Colors.black26,
                                ),
                                Text(
                                  '800m away',
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 0, 5),
                    child:const Text(
                      'About',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Text(
                      'Dr. Stefi Hezel completed her graduation from Sher-E Bangla Medical College in 1995. She dedicated her training in the field of Radiology and Imaging and accomplished ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                    child: Container(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children:  [
                          DatePick(
                            date: '21',
                            day: 'Mon',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '23',
                            day: 'Tue',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '24',
                            day: 'Wed',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '25',
                            day: 'Thu',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '26',
                            day: 'Fri',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '28',
                            day: 'Sat',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '29',
                            day: 'Sun',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '1',
                            day: 'Mon',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '2',
                            day: 'Tue',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '3',
                            day: 'Wed',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '4',
                            day: 'Thu',
                            onDateSelected: _handleDateSelected,
                          ),
                          DatePick(
                            date: '5',
                            day: 'Fri',
                            onDateSelected: _handleDateSelected,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Wrap(children: [
                      Timepick(
                        time: '09.00 AM',
                        available: false,
                        onDateSelected: _handleTimeSelected,
                      ),
                      Timepick(
                        time: '10.00 AM',
                        available: true,
                        onDateSelected: _handleTimeSelected,
                      ),
                      Timepick(
                        time: '11.00 AM',
                        available: false,
                        onDateSelected: _handleTimeSelected,
                      ),
                      Timepick(
                        time: '12.00 AM',
                        available: false,
                        onDateSelected: _handleTimeSelected,
                      ),
                      Timepick(
                        time: '01.00 AM',
                        available: true,
                        onDateSelected: _handleTimeSelected,
                      ),
                      Timepick(
                        time: '02.00 AM',
                        available: true,
                        onDateSelected: _handleTimeSelected,
                      ),
                      Timepick(
                        time: '03.00 AM',
                        available: true,
                        onDateSelected: _handleTimeSelected,
                      ),
                      Timepick(
                        time: '03.00 AM',
                        available: true,
                        onDateSelected: _handleTimeSelected,
                      ),
                      Timepick(
                        time: '04.00 AM',
                        available: false,
                        onDateSelected: _handleTimeSelected,
                      ),
                    ]),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffd4f7fc),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/msg');
                            },
                            child: const Icon(
                              CupertinoIcons.chat_bubble_text,
                              color: Color(0xff32c1e0),
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 7,
                      child: GestureDetector(
                        onTap: () {
                          if (selectedDate.isNotEmpty&& selectedTime.isNotEmpty) {
                            //final appointment = Appointment('Dr. Stefi Hezel',DateTime.parse("$selectedDate $selectedTime") );
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/schedule'
                                //arguments: appointment
                            );
                            print("Selected date: $selectedDate\nSelected time: $selectedTime");
                          } else {
                            print("No date/time selected");
                          }
                          selectedDate='';
                          selectedTime='';
                      },
                          child: Container(
                            height:60,
                            decoration: BoxDecoration(
                                color: const Color(0xff32c1e0),
                                borderRadius: BorderRadius.circular(32)),
                            child: const Center(
                              child: Text(
                                'Book Appointment',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
