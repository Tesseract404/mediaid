import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class formFields extends StatelessWidget {
  final title;
  final IconData logo;
  final  TextEditingController controller;
  final bool obs;

  const formFields({Key? key,
    this.title, required this.logo, required this.controller, required this.obs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 66,
        width: 350,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: Colors.black12
            ),
            color: const Color(0xFFfaf6f5),
            borderRadius: BorderRadius.circular(25)),
        child:   Padding(
          padding: EdgeInsets.fromLTRB(10, 8, 10, 14),
          child: TextField(
            obscureText: obs? true:false,
            controller: controller,
            decoration: InputDecoration(
              icon:  Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Icon( logo,
                  color: Colors.black26,
                  size: 29,),
              ),
              hintText: title,
              hintStyle: TextStyle(
                fontSize: 18,
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
        ));
  }
}