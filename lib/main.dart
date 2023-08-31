  import 'package:flutter/material.dart';
import 'package:mediaid1/Screens/AddPresc.dart';
import 'package:mediaid1/Screens/Chats.dart';
import 'package:mediaid1/Screens/Demo.dart';
import 'package:mediaid1/Screens/DocProfile.dart';
import 'package:mediaid1/Screens/Doctors.dart';
import 'package:mediaid1/Screens/GetStarted.dart';
import 'package:mediaid1/Screens/Health.dart';
import 'package:mediaid1/Screens/Hospitals.dart';
import 'package:mediaid1/Screens/Insurance.dart';
import 'package:mediaid1/Screens/Intro3.dart';
import 'package:mediaid1/Screens/MedicalRecords.dart';
import 'package:mediaid1/Screens/Messages.dart';
import 'package:mediaid1/Screens/Prescription.dart';
import 'package:mediaid1/Screens/Union.dart';
import 'Screens/FindDoctors.dart';
import 'Screens/Home.dart';
import 'Screens/Intro1.dart';
import 'Screens/Intro2.dart';
import 'Screens/LandingPage.dart';
import 'Screens/Login.dart';
import 'Screens/Medbot.dart';
import 'Screens/Profile.dart';
import 'Screens/Schedules.dart';
import 'Screens/SignUp.dart';
import 'package:provider/provider.dart';

import 'Services/ChatProvider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ChatProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Medi-Aid",
          routes: {
            '/': (context) => const LandingPage(),
            '/intro1': (context) => const Intro1(),
            '/intro2': (context) => const Intro2(),
            '/intro3': (context) => const Intro3(),
            '/getstart': (context) => const GetStarted(),
            '/doctors': (context) => const Doctors(),
            '/hospitals': (context) => const Hospitals(),
            '/docid': (context) => const DocProfile(image: '??',name: '??',spec: '??',),
            '/demo': (context) => const Demo(),
            '/records': (context) => const MedicalRecords(),
            '/ai': (context) => const Medbot(),
            '/finddoctors': (context) => const FindDoctors(),
            '/login' : (context) => const Login(),
            '/health' : (context) => const Health(),
            '/presc' : (context) => const Prescription(),
            '/addpresc' : (context) => const AddPresc(),
            '/signup' : (context) => const SignUp (),
            '/union' : (context) =>   Union (index: 0,),
            '/schedule' : (context) => const Schedules(),
            '/msg' : (context) => const Messages(),
            '/insurance' : (context) => const Insurance(),
            '/chats' : (context) =>   const Chats(name: '??', id: -1, user: true,),
             '/home' : (context) => const Home(),
            '/profile' : (context) => const Profile(),
          },
          initialRoute: '/',
        ),
      )
  );
}