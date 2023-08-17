import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/buttons/ActionButton.dart';
import 'package:mediaid1/Widgets/insuranceCard.dart';

import '../Widgets/buttons/backbutton.dart';
class Insurance extends StatefulWidget {
  const Insurance({Key? key}) : super(key: key);

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading:backbutton (),
        centerTitle: true,
        title: Row(
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0 , 20,  0),
                child: Text(
                  'Insurance Dashboard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          insuranceCard(image: 'assets/wpa.png',name: 'WPA Health Insurance',price: '33000/- Taka',),
          insuranceCard(image: 'assets/metlife.png',name: 'Metlife Health Insurance',price: '56000/- Taka',),
          Padding(
            padding: const EdgeInsets.fromLTRB( 0, 50,  0, 0),
            child: ActionButton(route: '/insurance',title: 'Add Plan',),
          )
        ],
      ),
    );
  }
}
