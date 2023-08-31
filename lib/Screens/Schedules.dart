import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:mediaid1/Model/ScheduleData.dart';

import 'package:mediaid1/Widgets/ScheduleCard2.dart';

import '../Services/Api_Constants.dart';
import '../Services/UserDataManager.dart';
import '../Widgets/buttons/UnionpopButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Schedules extends StatefulWidget {
  const Schedules({Key? key}) : super(key: key);
  @override
  State<Schedules> createState() => _SchedulesState();
}
class _SchedulesState extends State<Schedules> {
  List<ScheduleData> _scheduleList = [];
  bool isLoading = true;
  var  userId= -1;
  final userDataManager = UserDataManager();
  late Timer _timer;
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (mounted) {
        fetchScheduleData();
      }
    });
  }
  Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('user_id') ?? -1;
    return id;
  }

  Future<void> fetchScheduleData() async {
    userId= await getUserId();
    print(userId);
    try {
      var url ='$BASE_URL/fetchschedule.php?user_id=$userId';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
         final List<ScheduleData> fetchedData = List<ScheduleData>.from(data.map((item) => ScheduleData(
           id: item['schedule_id'],
           title: item['doctor_name'],
           image: 'assets/default.png',
           category: 'Cardiologist',
           time: item['time'],
           date: item['date'],

        )));
        setState(() {

        _scheduleList = fetchedData;
          isLoading = false;
        });
      } else {
        isLoading = false;
      }
    } catch (error) {
      print('Error fetching data: $error');
      // Handle errors as needed
    }
  }
  Future<void> deleteScheduleData(int scheduleId) async {
    try {
      var url ='$BASE_URL/deleteschedule.php?schedule_id=$scheduleId';
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
         print('Schedule deleted successfully');
      } else {
         throw Exception('Failed to delete schedule: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting data: $error');
      // Handle errors as needed
    }
  }


  @override
  void initState()   {
    super.initState();
    fetchScheduleData();
    startTimer();
    userDataManager.initializeUserData().then((_) {
      setState(() {});
    });

  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: UnionpopButton(),
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: const Text(
          'Schedule',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 25
          ),
        ),
      ),
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             if(_scheduleList.isNotEmpty)
               Column(
                 children: [
                   for (int index = 0; index < _scheduleList.length; index++)
                     ScheduleCard2(
                       name: _scheduleList[index].title,
                       //image: _scheduleList[index].image!,
                       category: _scheduleList[index].category,
                       time: _scheduleList[index].time,
                       date: _scheduleList[index].date,
                       scheduleId: _scheduleList[index].id,
                       onDeletePressed: () {
                         setState(() {
                           deleteScheduleData(_scheduleList[index].id);
                           _scheduleList.removeAt(index);
                         });
                       },
                       onReschedulePressed: () {
                         setState(() {
                           deleteScheduleData(_scheduleList[index].id);
                           _scheduleList.removeAt(index);
                           Navigator.pushNamed(context, '/doctors');
                         });
                       },
                     ),
                 ],
               )
             else  if (!isLoading)
               const Padding(
                 padding: EdgeInsets.fromLTRB(0, 270, 0, 200),
                 child: SizedBox(
                   child: Align(
                     alignment: Alignment.center,
                     child: Text(
                       'You are all done for now!',
                       textAlign: TextAlign.center,
                     ),
                   ),
                 ),
               )
             else
               const Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Center(child: CircularProgressIndicator()),
               )
          ],
        ),
      ),
// const ScheduleCard(image:'assets/doc2.png',name:'Dr. Marcus Horizon',exp:'(Chardiologist)',),
       // const ScheduleCard(image:'assets/doc1.png',name:'Dr. Alysa Hana',exp:'(Psychologist)',),
       // // for (int index = 0; index < _scheduleList.length; index++)
       // //   ScheduleCard2(
       // //       name: _scheduleList[index].title,
       // //       image: _scheduleList[index].image,
       // //       category: _scheduleList[index].category,
       // //       time: _scheduleList[index].time,
       // //       date: _scheduleList[index].date,
       // //       onDeletePressed: () {
       // //         setState(() {
       // //           _scheduleList.removeAt(index);
       // //         });
       // //       },)

      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/doctors');
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: Icon(
                CupertinoIcons.plus_circle_fill,
                color: Colors.grey,
                size: 60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
