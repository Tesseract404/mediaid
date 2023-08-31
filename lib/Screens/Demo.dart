import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/buttons/CustActionButton.dart';
class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      //   toolbarHeight: 80,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(
      //           'DEMO PAGE',
      //           style: TextStyle(
      //               color: Colors.black87,
      //               fontWeight: FontWeight.w600,
      //               fontSize: 25
      //           ),
      //         ),
      //       ),
      //
      //     ],
      //   ),
      // ),
      body:  Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xff8FF4F2),
                    Color(0xffffffff),
                    Color(0xffffffff),
                    Color(0xffffffff),
                  ],
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
        children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0 , 40, 0),
              child: Image(image: AssetImage(
                'assets/logo2.png',
              )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0 , 20, 0),
              child: Text('Mediaid is a cutting-edge healthcare app designed to make accessing medical expertise effortless. With its user-friendly interface, it connects users with healthcare professionals in seconds. Whether you have a pressing medical concern or need routine advice, Mediaid ensures prompt and convenient access to doctors through telemedicine. Need medical advice? Mediaid allows users to quickly connect with certified healthcare professionals , ensuring immediate attention to your health concerns.For quick answers and non-emergency health inquiries, our Medibot AI assistant is at your service 24/7. Get instant information and guidance on symptoms, medications, and more.',
              textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black38
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 30 , 50, 0),
              child: CustActionButton(route: '/union', height: 50,title: 'Go to App',),
            ), Padding(
              padding: EdgeInsets.fromLTRB(50, 10 , 50, 0),
              child: CustActionButton(route: '/union', height: 50,title: 'Our Website',),
            ),
        ],
      ),
          ))
    );
  }
}
