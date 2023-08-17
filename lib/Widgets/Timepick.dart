import 'package:flutter/material.dart';

class Timepick extends StatefulWidget {
  final time;
  final bool available;
  final Function(String) onDateSelected;
  const Timepick({Key? key, this.time, required this.available, required this.onDateSelected}) : super(key: key);

  @override
  State<Timepick> createState() => _TimepickState();
}

class _TimepickState extends State<Timepick> {
  var i= 0;
  @override
  Widget build(BuildContext context) {
    if(i==0){
      if (widget.available == true) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              setState(() {
                i = 1;print('tapped');print(i);
              });
              widget.onDateSelected(widget.time);
            },
            child: Container(
              height: 38,
              width: 105,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xff32c1e0), width: 1.5)),
              child: Center(
                child: Text(
                  widget.time,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45),
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
    }else{
      if (widget.available == true) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              setState(() {
                i = 0;print('tapped');print(i);
              });
            },
            child: Container(
              height: 38,
              width: 105,
              decoration: BoxDecoration(
                  color:  Color(0xff32c1e0),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xff32c1e0), width: 1.5)),
              child: Center(
                child: Text(
                  widget.time,
                  style: TextStyle(
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

