import 'package:flutter/material.dart';

import '../Screens/Chats.dart';
class ChatHeads extends StatelessWidget {
  final String image;
  final name;
  final lasttxt;
  final time;
  const ChatHeads({Key? key, required this.image, this.name, this.lasttxt, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chats(name: name),
            ),
          );
        },
        child: Container(
          child: ListTile(
            leading: Container(
              height: 75,
              width: 75,
              decoration:   BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                  )
              ),
            ),
            title: Text(
              name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              lasttxt,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
              trailing: Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                   color: Colors.grey
                ),
              ),
          ),
        ),
      ),
    );
  }
}
