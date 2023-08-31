import 'package:flutter/material.dart';

class Timepick extends StatefulWidget {
  final time;
  final bool available;
  final bool select;
  final Function(String) onDateSelected;
  final Function() onSelected;
  const Timepick(
      {Key? key,
      this.time,
      required this.available,
      required this.onDateSelected, required this.select, required this.onSelected})
      : super(key: key);

  @override
  State<Timepick> createState() => _TimepickState();
}

class _TimepickState extends State<Timepick> {
  var i = 0;
  @override
  Widget build(BuildContext context) {
    if (i == 0) {
      if (widget.available == true) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              if (widget.select) {
                widget.onDateSelected(widget.time);
              }
              setState(() {
                if(widget.select){
                  i = 1;
                  print('tapped');
                  print(i);
                  widget.onSelected();
                }
              });
            },
            child: widget.select
                ? Container(
                    height: 38,
                    width: 105,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: const Color(0xff32c1e0), width: 1.5)),
                    child: Center(
                      child: Text(
                        widget.time,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ),
                  )
                : Container(
                    height: 38,
                    width: 105,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: Colors.white12, width: 1.5)),
                    child: Center(
                      child: Text(
                        widget.time,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black26),
                      ),
                    ),
                  ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 38,
            width: 105,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade300, width: 1.5)),
            child: Center(
              child: Text(
                widget.time,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400),
              ),
            ),
          ),
        );
      }
    } else {
      if (widget.available == true) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
              height: 38,
              width: 105,
              decoration: BoxDecoration(
                  color: const Color(0xff32c1e0),
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: const Color(0xff32c1e0), width: 1.5)),
              child: Center(
                child: Text(
                  widget.time,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 38,
            width: 105,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade200, width: 1.5)),
            child: Center(
              child: Text(
                widget.time,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade200),
              ),
            ),
          ),
        );
      }
    }
  }
}
