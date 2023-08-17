import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/DocProfile.dart';
class docHomeCard extends StatelessWidget {
  final String image;
  final title;
  final subtitle;
  final distance;
  final rating;

  const docHomeCard({Key? key, required this.image, this.title, this.subtitle, this.distance, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DocProfile(name: title, image: image,spec: subtitle,),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 170,
          width: 130,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                spreadRadius: 0.5,
              )]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              image,
                            ),
                            scale: 15,
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 0, 0, 8),
                child: Text(title,
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 0, 0, 10),
                child: Text(subtitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 10
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              size: 12,
                            ),
                            Text(rating,
                              style: TextStyle(
                                  color: Color(0xff38CC86),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10
                              ),),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.location_solid,size: 12,color: Colors.black26,),
                        Text(distance,
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w400,
                              fontSize: 10
                          ),)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
