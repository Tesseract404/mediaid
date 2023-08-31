import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/DocProfile.dart';
class docCard2 extends StatelessWidget {
  final String? image;
  final title;
  final subtitle;
  final List<String> hospital;
  final route;
  const docCard2({Key? key, required this.image, this.title, this.subtitle, this.route, required this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    hospital.shuffle();
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
              boxShadow: const [BoxShadow(
                color: Colors.black12,
                blurRadius: 1.0,
                spreadRadius: 0.2,
              )]
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: image!.isNotEmpty?
                      (showImage(image!) as Image).image
                          : const AssetImage('default.png'),
                      height: 135,width: 120,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,10  , 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                        ),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,5  , 0, 5),
                        child: Text(subtitle,
                          style: const TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text(hospital[0],
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),),
                      ),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
