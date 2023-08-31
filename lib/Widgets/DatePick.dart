
import 'package:flutter/material.dart';

class DatePick extends StatefulWidget {
  final date;
  final day;
  final bool select;
  final Function(String) onDateSelected;
  final Function() onSelected;
  const DatePick(
      {Key? key,
      this.date,
      this.day,
      required this.onDateSelected,
        required this.onSelected, required this.select})
      : super(key: key);

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  var i = 0;
  @override
  Widget build(BuildContext context) {
    if (i == 0) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            if (widget.select) {
              widget.onDateSelected(widget.date);
            }
            setState(() {
              if (widget.select) {
                i = 1;
                print('tapped');
                print(i);
                widget.onSelected();
              }
            });

          },
          child: widget.select
              ? Container(
                  height: 85,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1.0,
                          spreadRadius: 0.1,
                        )
                      ]),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.day,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.grey)),
                        Text(widget.date,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 26)),
                      ],
                    ),
                  ),
                )
              : Container(
                  height: 85,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white60,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1.0,
                          spreadRadius: 0.1,
                        )
                      ]),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.day,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.grey)),
                        Text(widget.date,
                            style: const TextStyle(
                                color: Colors.black12,
                                fontWeight: FontWeight.w600,
                                fontSize: 26)),
                      ],
                    ),
                  ),
                ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              i = 0;
              widget.onSelected();
              print('tapped');
              print(i);
            });
          },
          child: Container(
            height: 85,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xff32c1e0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1.0,
                    spreadRadius: 0.1,
                  )
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.day,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.white)),
                  Text(widget.date,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
