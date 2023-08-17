import 'package:flutter/material.dart';

import '../../Screens/DocProfile.dart';
class SCustomButton2 extends StatelessWidget {
  final title;
  final name;
  final exp;
  final image;
  final Color color;
  final Color Tcolor;

  final double height;
  const SCustomButton2({Key? key, this.title,  required this.height, required this.color, required this.Tcolor, this.name, this.exp, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: () {
        if(title!='Cancel'){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DocProfile(name: name, image: image,spec: exp,),
            ),
          );
        }
      },
      child: Container(
        height:height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            title,
            style:   TextStyle(
              color: Tcolor ,
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
