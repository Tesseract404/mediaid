import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/buttons/docHomeCard.dart';

import '../Widgets/buttons/homebuttons.dart';
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
      drawer: Drawer(
        child: ListView(
          children:[
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff82bcc4)
                ),
                accountName: Text('Name',style: TextStyle(
                  fontSize: 22
                ),), accountEmail: Text('exm@gmail.com')),
            ListTile(
              onTap: (){
                Navigator.pop(context);
              },
              leading:Icon(CupertinoIcons.home),
              title: Text('Home',style: TextStyle(
                fontSize: 18
              ),),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '');
              },
              leading:Icon( Icons.contact_page_outlined),
              title: Text('Medical Records',style: TextStyle(
                  fontSize: 18
              ),),
            ),ListTile(
              onTap: (){
                Navigator.pushNamed(context, '');
              },
              leading:Icon(Icons.history),
              title: Text('History',style: TextStyle(
                  fontSize: 18
              ),),
            ),ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/profile');
              },
              leading:Icon(CupertinoIcons.person),
              title: Text('Profile',style: TextStyle(
                  fontSize: 18
              ),),
            ),ListTile(
              onTap: (){
                Navigator.pushNamed(context, '');
              },
              leading:Icon(CupertinoIcons.text_bubble),
              title: Text('Messages',style: TextStyle(
                  fontSize: 18
              ),),
            ),ListTile(
              onTap: (){
                Navigator.pushNamed(context, '');
              },
              leading:Icon(CupertinoIcons.calendar_today),
              title: Text('Appointment',style: TextStyle(
                  fontSize: 18
              ),),
            ),ListTile(
              onTap: (){
                Navigator.pushNamed(context, '');
              },
              leading:Icon(CupertinoIcons.checkmark_shield),
              title: Text('Insurance',style: TextStyle(
                  fontSize: 18
              ),),
            ),ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/getstart');
              },
              leading:Icon(Icons.logout),
              title: Text('Sign Out',style: TextStyle(
                  fontSize: 18
              ),),
            ),
          ]
        ),
      ),
      appBar: AppBar(
        iconTheme:IconThemeData(color: Colors.black),
        elevation: 0,
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        // leading: const Icon(CupertinoIcons.bars,
        // size: 40,
        // color: Colors.black,),
        title: Row(
          children: const [
            Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0 , 20,  0),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
            child: Container(
            height: 56,
            decoration: BoxDecoration(
                color: const Color(0xFFfaf6f5),
                borderRadius: BorderRadius.circular(35),
              boxShadow: const [BoxShadow(
            color: Colors.black12,
              blurRadius: 2.0,
              spreadRadius: 0.5,
            )]
            ),

            child:   Padding(
              padding: const EdgeInsets.fromLTRB(19, 8, 10, 12),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(CupertinoIcons.search,
                  color: Colors.grey,),
                  hintText: 'Search doctors, drugs, articles...',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                homebuttons(title: 'Doctors', image: 'assets/steth.png', route: '/doctors',),
                homebuttons(title: 'Hospital', image: 'assets/hospital.png', route: '/doctors',),
                homebuttons(title: 'Health', image: 'assets/care.png', route: '/doctors',),
                homebuttons(title: 'Prescription', image: 'assets/pill.png', route: '/doctors',),

              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffcff2ff),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'Early protection for your family health',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.cyan
                              ),
                              child: Center(
                                child: Text(
                                  'Learn More',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Image(image: AssetImage(
                          'assets/lady2.png'
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Doctors',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17
                  ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/doctors');
                    },
                    child: Text('See all',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: CupertinoColors.systemGreen
                    ),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(19, 10, 0, 0),
              child: Container(
                height: 200,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                [
                  docHomeCard(image: 'assets/doc2.png',title: 'Dr. Marcus Horiz',subtitle: 'Chardiologist',rating: '4.7',distance: '800m away'),
                  docHomeCard(image: 'assets/doc3.png',title: 'Dr. Maria ELena',subtitle: 'Psychologist',rating: '4.4',distance: '1.2km away'),
                  docHomeCard(image: 'assets/doc4.png',title: 'Dr. Marcus Horiz',subtitle: 'Chardiologist',rating: '4.7',distance: '800m away'),
                  docHomeCard(image: 'assets/doc1.png',title: 'Dr. Marcus Horiz',subtitle: 'Chardiologist',rating: '4.7',distance: '800m away'),
                  docHomeCard(image: 'assets/doc2.png',title: 'Dr. Marcus Horiz',subtitle: 'Chardiologist',rating: '4.7',distance: '800m away'),
                ]
                ),
              ),
            ),],
        ),
      ),


    );
  }
}
