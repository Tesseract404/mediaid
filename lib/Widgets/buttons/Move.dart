import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Move extends StatelessWidget {
  final route;
  const Move({Key? key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff1e81b0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(CupertinoIcons.right_chevron,color: Colors.white,
            size: 25,),
        ),
      ),
    );
  }
}
