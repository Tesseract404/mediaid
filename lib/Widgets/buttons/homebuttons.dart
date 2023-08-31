import 'package:flutter/material.dart';
class homebuttons extends StatelessWidget {
  final title;
  final String image;
  final String route;

  const homebuttons({Key? key, this.title, required this.image, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, route);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1.0,
                    spreadRadius: 0.2,
                  )]
              ),
              child:   Padding(
                padding: EdgeInsets.all(12.0),
                child: Image(
                  image: AssetImage(
                    image,
                  ),
                  height: 48,
                  width: 48,
                ),
              ),
            ),
          ),
          SizedBox(height: 3,),
          Text(title,
          style: TextStyle(
            color: Colors.black26,
          ),)
        ],
      ),
    );
  }
}
