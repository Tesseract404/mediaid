import 'package:flutter/material.dart';

class diagnosisSmaller extends StatelessWidget {
  final icon;
  final title;
  final count;
  const diagnosisSmaller({Key? key, this.icon, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
          child: Image(
            image: AssetImage(icon),
            height: 48,width: 48,
          ),
        ),
        Text(
          title  ,
          textAlign: TextAlign.center,
          style: TextStyle(

              fontSize: 12,
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
                fontSize: 18,
                color: Colors.black54
            ),
          ),
        ),


      ],
    );
  }
}
