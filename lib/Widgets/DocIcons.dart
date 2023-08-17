import 'package:flutter/material.dart';

import '../Screens/DocProfile.dart';
class DocIcons extends StatelessWidget {
  final String image;
  final title;
  final subtitle;
  const DocIcons({Key? key, required this.image, this.title, this.subtitle}) : super(key: key);

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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
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
            Text(title)
          ],
        ),
      ),
    );
  }
}
