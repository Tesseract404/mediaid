import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/DocProfile.dart';
class docCard2 extends StatelessWidget {
  final String image;
  final title;
  final subtitle;
  final hospital;
  final route;
  const docCard2({Key? key, required this.image, this.title, this.subtitle, this.route, this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DocProfile(name: title, image: image,spec: subtitle,),
            ),
          );
        },
        child: Container(
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
                    height: 135,
                    width: 120,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10  , 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(hospital,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),),
                    ),

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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
