import 'package:flutter/material.dart';
import 'package:mediaid1/Model/userdata.dart';

import '../Screens/Chats.dart';
import '../Screens/DocProfile.dart';
class ChatHeads extends StatelessWidget {
  final String? image;
  final name;
  final lasttxt;
  final time;
  final id;
  final bool user;
  const ChatHeads({Key? key, required this.image, this.name, this.lasttxt, this.time, this.id, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chats(name: name,id: id, user: user,),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: image!.isNotEmpty
                      ? (showImage(image!) as Image).image
                      :   AssetImage('assets/default.png'),
                ),
              ),
            ),
            SizedBox(width: 10), // Add some spacing
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      lasttxt,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black38
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
