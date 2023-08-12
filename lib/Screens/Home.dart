import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        leading: const Icon(CupertinoIcons.bars,
        size: 40,
        color: Colors.black,),
        title: Row(
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0 , 20,  0),
                child: Text(
                  'Fine your desired \nhealth solution'  ,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.black
                  ),
                ),
              ),
            ),
            Expanded(
              child: Icon(Icons.notifications_none_rounded,
              color: Colors.black38,
              size: 35,),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () { Navigator.pushNamed(context, '/doctors'); }, child: Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Check our Top Doctors',
          style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black
          ),),
                ),
              ),
          ),
        ],
      ),

    );
  }
}
