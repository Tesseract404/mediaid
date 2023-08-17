import 'package:flutter/material.dart';
class Datebutton extends StatelessWidget {
  final int pick;
  final date;
  final day;
  const Datebutton({Key? key, required this.pick, this.date, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pick == 0){
      return Container(
        height: 90,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 85,
                width: 60,
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
                          day,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13, color: Colors.grey
                          )
                      ), Text(
                          date,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 26
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ]
        ),
      );
    }else{
      return Container(
        height: 90,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 85,
                width: 60,
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
                          day,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13, color: Colors.white
                          )
                      ), Text(
                         date,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 26,color: Colors.white
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ]
        ),
      );
    }
  }
}
