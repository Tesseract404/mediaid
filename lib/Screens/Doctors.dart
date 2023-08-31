import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/buttons/backbutton.dart';
import 'package:mediaid1/Widgets/docCard.dart';

import '../Model/doctorModel.dart';
import '../Services/DoctorList.dart';
class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List<doctorModel> _doctorsList = DoctorList().doctorList;
 // List<doctorModel> _doctorsList = [];
  bool isloading= false;
  @override
  // void initState() {
  //   super.initState();
  //   //fetchDoctors();
  // }
  // Future<void> fetchDoctors() async {
  //   try{
  //     final response = await http.get(Uri.parse('$BASE_URL/fetchdoctors.php'));
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body) ;
  //       final List<doctorModel> fetchedData = List<doctorModel>.from(
  //         data.map(
  //               (item) {
  //             // Decode the base64 image data
  //             String base64Image = item['image'];
  //             Base64Codec base64 = const Base64Codec();
  //             base64Image = base64.normalize(base64Image);
  //             if (base64Image.startsWith("data:")) {
  //               final commaIndex = base64Image.indexOf(",");
  //               if (commaIndex != -1) {
  //                 base64Image = base64Image.substring(commaIndex + 1);
  //               }
  //             }
  //             return doctorModel(
  //               title: item['name'],
  //               category: item['spec'],
  //               image: base64Image, // Store decoded image bytes
  //             );
  //           },
  //         ),
  //       );
  //       setState(() {
  //         _doctorsList = fetchedData ;
  //         isloading = false;
  //       });
  //     } else {
  //       isloading = false;
  //       throw Exception('Failed to load data');
  //     }
  //   }catch(e){
  //     print('Error fetching data: $e');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading:backbutton (),
        title: Row(
          children: const [
            Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0 , 20,  0),
                child: Text(
                  'Top Doctors'  ,
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(_doctorsList.isNotEmpty)
              Column(
                children: [
                  for (int index = 0; index < _doctorsList.length; index++)
                    docCard(
                      image:  _doctorsList[index].image,
                      title: _doctorsList[index].title,
                      subtitle: _doctorsList[index].category,
                    )
                ],
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              )

          ],
        ),
        // Column(
        //   children: [
        //     SizedBox(height: 10,),
        //     docCard(image: 'assets/doc1.png',title: 'Dr. Stefi hezel',subtitle: 'Chardiologist',),
        //     docCard(image: 'assets/doc2.png',title: 'Dr. Marcus Horizon',subtitle: 'Orthopedist',),
        //     docCard(image: 'assets/doc3.png',title: 'Dr. Diandra',subtitle: 'Psychologist',),
        //     docCard(image: 'assets/doc4.png',title: 'Dr. Gerty Cori',subtitle: 'Chardiologist',),
        //
        //   ],
        // ),
      ),
    );
  }
}
