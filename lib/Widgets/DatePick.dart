import 'package:flutter/material.dart';
 class DatePick extends StatefulWidget {
   final date;
   final day;
   final Function(String) onDateSelected;
   const DatePick({Key? key, this.date, this.day, required this.onDateSelected}) : super(key: key);

   @override
   State<DatePick> createState() => _DatePickState();
 }

 class _DatePickState extends State<DatePick> {
   var i=0;
   @override
   Widget build(BuildContext context) {
     if(i==0) {
       return Padding(
         padding: const EdgeInsets.all(5.0),
         child: GestureDetector(
           onTap: () {
             setState(() {
               i = 1;print('tapped');print(i);
             });
             widget.onDateSelected(widget.date);
           },
           child: Container(
             height: 85,
             width: 55,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(18),
                 color: Colors.white,
                 boxShadow: [BoxShadow(
                   color: Colors.black26,
                   blurRadius: 1.0,
                   spreadRadius: 0.1,
                 )
                 ]
             ),
             child: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                       widget.day,
                       style: TextStyle(
                           fontWeight: FontWeight.w400,
                           fontSize: 13, color: Colors.grey
                       )
                   ), Text(
                       widget.date,
                       style: TextStyle(
                           fontWeight: FontWeight.w600,
                           fontSize: 26
                       )
                   ),
                 ],
               ),
             ),
           ),
         ),
       );
     }else{
       return Padding(
         padding: const EdgeInsets.all(5.0),
         child: GestureDetector(
           onTap: () {
             setState(() {
               i = 0;print('tapped');print(i);
             });
           },
           child:
           Container(
             height: 85,
             width: 55,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(18),
                 color: Color(0xff32c1e0),
                 boxShadow: [BoxShadow(
                   color: Colors.black26,
                   blurRadius: 1.0,
                   spreadRadius: 0.1,
                 )
                 ]
             ),
             child: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                       widget.day,
                       style: TextStyle(
                           fontWeight: FontWeight.w400,
                           fontSize: 13, color: Colors.white
                       )
                   ), Text(
                       widget.date,
                       style: TextStyle(
                           fontWeight: FontWeight.w600,
                           fontSize: 26,color: Colors.white
                       )
                   ),
                 ],
               ),
             ),
           ),
         ),
       );
     }
   }
 }
