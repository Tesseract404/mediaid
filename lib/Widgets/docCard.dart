import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Screens/DocProfile.dart';
class docCard extends StatelessWidget {
  final String? image;
  final title;
  final subtitle;
  final route;
  const docCard({Key? key, required this.image, this.title, this.subtitle, this.route}) : super(key: key);
  showImage(String image){
    return Image.memory(base64Decode(image),);
  }
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
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: image!.isNotEmpty?
                      (showImage(image!) as Image).image
                          : const AssetImage('default.png'),
                      height: 115,width: 115,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
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
                    Row(
                      children: [
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
                      ],
                    ),

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
