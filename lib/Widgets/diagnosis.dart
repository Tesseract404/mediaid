import 'package:flutter/material.dart';
class diagnosis extends StatelessWidget {
  final icon;
  final title;
  final count;
  const diagnosis({Key? key, this.icon, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Image(
            image: AssetImage(icon),
            height: 100,width: 100,
          ),
        ),
        Text(
          title  ,
          textAlign: TextAlign.center,
          style: TextStyle(

              fontSize: 14,
              color: Colors.black26
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            count  ,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Colors.black54
            ),
          ),
        ),


      ],
    );
  }
}
