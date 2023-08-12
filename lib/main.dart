  import 'package:flutter/material.dart';
import 'package:mediaid1/Screens/Doctors.dart';
import 'package:mediaid1/Screens/GetStarted.dart';
import 'package:mediaid1/Screens/Intro3.dart';
import 'package:mediaid1/Screens/Union.dart';

import 'Screens/Home.dart';
import 'Screens/Intro1.dart';
import 'Screens/Intro2.dart';
import 'Screens/LandingPage.dart';
import 'Screens/Login.dart';
import 'Screens/Profile.dart';
import 'Screens/SignUp.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Medi-Aid",
        routes: {
          '/': (context) => const LandingPage(),
          '/intro1': (context) => const Intro1(),
          '/intro2': (context) => const Intro2(),
          '/intro3': (context) => const Intro3(),
          '/getstart': (context) => const GetStarted(),
          '/doctors': (context) => const Doctors(),
          //'/intro1': (context) => const Intro1(),
          // '/2': (context) => const LandingPage2(),
          // '/getstart': (context) => const GetStarted(),
          '/login' : (context) => const Login(),
          '/signup' : (context) => const SignUp (),
          '/union' : (context) => const Union (),
          // '/addcard' : (context) => const AddCard (),
          // '/payment' : (context) => const PaymentGate(),
          // '/confirm' : (context) => const ConfirmationWarn(),
           '/home' : (context) => const Home(),
          //'/settings' : (context) => const Settings(),
          '/profile' : (context) => const Profile(),
          // '/editUserProfile' : (context) => const EditProfileInfo(),

        },
        initialRoute: '/union',
      )
  );
}