import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/ChatHeads.dart';
class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Messages',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 25
                ),
              ),
            ),
            Icon(CupertinoIcons.search,
              color: Colors.black87,size: 26,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
             ChatHeads(image: 'assets/doc2.png',name: 'Dr. Marcus Horizon',lasttxt:'Not feeling good about it' ,time:'10:24' ,),
             ChatHeads(image: 'assets/doc1.png',name: 'Dr. Alysa Hana',lasttxt:'Hello' ,time:'09:52' ,),
             ChatHeads(image: 'assets/doc3.png',name: 'Dr. Maria Elena',lasttxt:'How are u now?' ,time:'08:10' ,),
          ],
        ),
      ),
    );
  }
}
