import 'package:flutter/material.dart';

import '../Widgets/buttons/backbutton.dart';
class Medbot extends StatefulWidget {
  const Medbot({Key? key}) : super(key: key);

  @override
  State<Medbot> createState() => _MedbotState();
}

class _MedbotState extends State<Medbot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading:backbutton (),
        centerTitle: true,
        title: Row(
          children: const [
            Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0 , 20,  0),
                child: Text(
                  'MedBot Ai'  ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Colors.black
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Center(
                child: Image(
                  image: AssetImage(
                    'assets/bot.png'
                  ),height: 180,width: 180,
                ),
              ),
              Text(
                'MedBot Ai'  ,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 31,
                    color: Color(0xff32c1e0),
                ),
              ),
            ],
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Icon(Icons.send,color: Color(0xff32c1e0),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ) ;
  }
}
