import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/PresCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/PrescriptionData.dart';
import '../Services/Api_Constants.dart';
import '../Services/UserDataManager.dart';
import '../Widgets/PresCard2.dart';
import '../Widgets/buttons/backbutton.dart';
import 'AddPresc.dart';

class Prescription extends StatefulWidget {
  const Prescription({Key? key}) : super(key: key);

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  List<PrescriptionData> _prescriptionList = [];
  bool isLoading = true;
  int userId = -1;
  final userDataManager = UserDataManager();
  @override
  void initState() {
    super.initState();
    fetchPrescData();
    userDataManager.initializeUserData().then((_) {
      setState(() {});
    });
    //userId = userDataManager.userId;
  }

  Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('user_id') ?? -1;
    return id;
  }

  Future<void> fetchPrescData() async {
    userId = await getUserId();
    print(userId);
    try {
      var url = '$BASE_URL/fetchprescr.php?user_id=$userId';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<PrescriptionData> fetchedData = List<PrescriptionData>.from(
          data.map(
            (item) {
              // Decode the base64 image data
              String base64Image = item['presc_photo'];
              Base64Codec base64 = const Base64Codec();
              base64Image = base64.normalize(base64Image);
              if (base64Image.startsWith("data:")) {
                final commaIndex = base64Image.indexOf(",");
                if (commaIndex != -1) {
                  base64Image = base64Image.substring(commaIndex + 1);
                }
              }
              return PrescriptionData(
                id: item['prescription_id'],
                title: item['doctor_name'],
                category: item['spec'],
                details: item['details'],
                image: base64Image, // Store decoded image bytes
              );
            },
          ),
        );

        setState(() {
          _prescriptionList = fetchedData;
          isLoading = false;
        });
      } else {
        isLoading = false;
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
      isLoading = false;
    }
  }

  Future<void> deletePrescData(int prescId) async {
    try {
      var url = '$BASE_URL/deletepresc.php?prescription_id=$prescId';
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        print('Prescription deleted successfully');
      } else {
        throw Exception(
            'Failed to delete Prescription: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting data: $error');
      // Handle errors as needed
    }
  }

  showImage(String image) {
    return Image.memory(base64Decode(image));
  }

  Future<void> _navigateToAddPresc() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPresc(),
      ),
    );
    if (result != null && result is PrescriptionData) {
      setState(() {
        _prescriptionList.add(result);
        //print("Number of prescriptions: ${_prescriptionList.length}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: const backbutton(),
        title: Row(
          children: const [
            Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text(
                  'Prescription',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // PresCard2(image: 'assets/pres.png',title: 'Dr. Murcus Horizon',category: 'Chardiologist',  details: 'Cardiac Arrest',  ),
            // PresCard2(image: 'assets/eco.png',title: 'Dr. Murcus Horizon',category: 'Chardiologist',  details: 'Echocardiogram',  ),
            if (_prescriptionList.isNotEmpty)
              Column(
                children: [
                  for (int index = 0; index < _prescriptionList.length; index++)
                    PresCard(
                      imageProvider: _prescriptionList[index].image,
                      title: _prescriptionList[index].title,
                      category: _prescriptionList[index].category,
                      details: _prescriptionList[index].details,
                      onDeletePressed: () {
                        setState(() {
                          deletePrescData(_prescriptionList[index].id);
                          _prescriptionList.removeAt(index);
                        });
                      },
                    ),
                ],
              )
            else if (!isLoading)
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 270, 0, 200),
                child: SizedBox(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'No Prescriptions for now',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              )
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: _navigateToAddPresc,
            child: Icon(
              CupertinoIcons.plus_app_fill,
              color: Color(0xff32c1e0),
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}
