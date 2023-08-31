import 'package:flutter/material.dart';
class addpresFormfields extends StatelessWidget {
  final hint;
  final line;
  final TextEditingController controller;
  const addpresFormfields({Key? key, this.hint, this.line, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(width: 1,color: Color(0xff32c1e0),)
        ),

        child:   TextField(
          controller: controller,
          maxLines: line,
          decoration: InputDecoration(
            icon:  Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            ),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 15,
              color: Colors.black26,
            ),
            focusColor: Colors.transparent,
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
          ),
          cursorColor: Colors.black45,
          cursorHeight: 25,
          cursorWidth: 1,
        ),
      ),
    );
  }
}
