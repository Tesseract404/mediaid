import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/buttons/backbutton.dart';
class Chats extends StatefulWidget {
  final String name;
  const Chats({Key? key, required this.name}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf7fc),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        leading:const backbutton (),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:   [
            Text(
              widget.name  ,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 21,
                  color: Colors.black
              ),
            ),
            const Icon(Icons.more_vert,color: Colors.black54,)
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: Colors.black12,width: 0.5)
                ),
                child: Column(
                  children: const[
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        'Start Consultation',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0xff32c1e0),
                        ),
                      ),
                    ),
                    Text(
                      'Here you can consult your problems to the doctor directly',
                      style: TextStyle(
                        fontSize:12 ,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: const [BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1.0,
                      spreadRadius: 0.2,
                    )]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Type message...',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              focusColor: Colors.transparent,
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                            cursorColor: Colors.black45,
                            cursorHeight: 25,
                            cursorWidth: 1,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(Icons.attachment_rounded,color: Color(0xff32c1e0),),
                    ),Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Icon(Icons.send,color: Color(0xff32c1e0),),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
