import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class docCard extends StatelessWidget {
  final String image;
  final title;
  final subtitle;
  const docCard({Key? key, required this.image, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        height: 125,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CupertinoColors.white,
            boxShadow: [BoxShadow(
              color: Colors.black12,
              blurRadius: 1.0,
              spreadRadius: 0.2,
            )]
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  image: AssetImage(
                    image,
                  ),
                  height: 115,
                  width: 115,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 7,),
                Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                  ),),
                SizedBox(height: 5,),
                Text(subtitle,
                  style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                  ),),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color:Color(0xffD8FCEB),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Icon(Icons.star,
                          color:  Color(0xff38CC86),
                          size: 18,
                        ),
                        SizedBox(width: 5,),
                        Text('4.7',
                          style: TextStyle(
                              color: Color(0xff38CC86),
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(CupertinoIcons.location_solid,size: 18,color: Colors.black26,),
                    Text('800m away',
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
