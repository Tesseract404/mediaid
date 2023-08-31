import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Model/ScheduleData.dart';
import 'package:mediaid1/Screens/Union.dart';
import 'package:mediaid1/Widgets/Timepick.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Services/Api_Constants.dart';
import '../Services/ScheduleManager.dart';
import '../Services/UserDataManager.dart';
import '../Widgets/DatePick.dart';
import '../Widgets/buttons/backbutton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/Api_Constants.dart';

showImage(String image) {
  return Image.memory(
    base64Decode(image),
  );
}

class DocProfile extends StatefulWidget {
  final name;
  final String? image;
  final spec;
  const DocProfile({Key? key, this.name, required this.image, this.spec})
      : super(key: key);

  @override
  State<DocProfile> createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
  final userDataManager = UserDataManager();
  String selectedDate = '';
  String selectedTime = '';
  ScheduleData? _scheduledata;
  int userId = -1;
  int convID = -1;
  bool select = true;
  bool select2 = true;
  @override
  void initState() {
    super.initState();
    userDataManager.initializeUserData().then((_) {
      setState(() {});
    });
  }

  void _handleDateSelected(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _handleTimeSelected(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  void _handleSelectedOnce() {
    setState(() {
      if (!select) {
        select = true;
      } else {
        select = false;
      }
    });
  }

  void _handleSelectedOnce2() {
    setState(() {
      if (!select2) {
        select2 = true;
      } else {
        select2 = false;
      }
    });
  }

  Future _scheduleDetails() async {
    final int id = userDataManager.userId;
    final String name = userDataManager.name;
    final String doctorsName = widget.name;
    final String category = widget.spec;
    final String date = selectedDate;
    final String time = selectedTime;
    final String? image = widget.image;

    final scheduleData = ScheduleData(
      image: image,
      title: doctorsName,
      category: category,
      date: date,
      time: time,
      id: 1,
    );
    setState(() {
      _scheduledata = scheduleData;
      //print(id);
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Union(index: 3)),
    );
    ScheduleManager().addSchedule(_scheduledata!);
    var url = Uri.parse('$BASE_URL/schedule.php');
    print('reached');
    var response = await http.post(url, body: {
      "user_id": id.toString(),
      "name": name,
      "doctor_name": doctorsName,
      "date": '2023/09/$date',
      "time": time,
    });
    print('reached');
    var data = json.decode(response.body);
    print(data);
    if (data['query'] == "success") {
      Fluttertoast.showToast(msg: 'New Schedule Added');
    }
  }

  Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('user_id') ?? -1;
    return id;
  }

  Future<void> createConversations() async {
    final int id = await getUserId();
    final String name = userDataManager.name;
    final String doctorsName = widget.name;
    final String? image = widget.image;

    try {
      print('running query now $id');
      var url = '$BASE_URL/createConv.php';
      final response = await http.post(
        Uri.parse(url),
        body: {
          "user_id": id.toString(),
          "name": name,
          "receiver_name": doctorsName,
          "image": image,
        },
      );
      var data = json.decode(response.body);
      print(data);
      if (data['status'] == "success") {
        print('Conversation added_1');
      } else {
        print('Error adding Conversation!!');
      }
      convID = await getConversationId();
      print('Convo id : $convID');

    } catch (error) {
      print('Error addind conversation: $error');
    }
    // finally {
    //
    // }
  }
  Future<void> createConversations2() async {
    final int id = userDataManager.userId;
    final String name = userDataManager.name;
    final String doctorsName = widget.name;
    //final String? image = widget.image;
    print(userId);
    try {
      var url = '$BASE_URL/createConv.php';
      final response = await http.post(
        Uri.parse(url),
        body: {
          "user_id": id.toString(),
          "name":  doctorsName,
          "receiver_name": name,
          "image": DEFAULT_IMG,
        },
      );
      var data = json.decode(response.body);
      print(data);
      if (data['status'] == "success") {
        print('Conversation added_1');
      } else {
        print('Error adding Conversation!!');
      }
      convID = await getConversationId();
      print('Convo id : $convID');

    } catch (error) {
      print('Error addind conversation: $error');
    }
    // finally {
    //
    // }
  }
  // Future<void> createConversations2() async {
  //   final int id = userDataManager.userId;
  //   final String name = userDataManager.name;
  //   final String doctorsName = widget.name;
  //   //final String? image  =  widget.image;
  //   try {
  //     //convID = await getConversationId();
  //     print('conv id is $convID');
  //     var url = '$BASE_URL/createConv2.php';
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: {
  //         'conv_id': '1001',
  //         'user_id': id.toString(),
  //         'name': doctorsName,
  //         'receiver_name': name,
  //         'image': DEFUALT_IMG,
  //       },
  //     );
  //     var data = json.decode(response.body);
  //     print(data);
  //     if (data['status'] == "success") {
  //       print('Conversation added');
  //     } else {
  //       print('Error adding Conversation!!');
  //     }
  //   } catch (error) {
  //     print('Error addind conversation: $error');
  //   }
  // }

  Future<int> getConversationId() async {
    userId = await getUserId();
    print('userID is $userId');
    final String receiver_name = widget.name;
    print('name is $receiver_name');
    try {
      var url =
          '$BASE_URL/getconvoid.php?user_id=$userId&receiver_name=$receiver_name';
      final response = await http.get(Uri.parse(url)); // Update the URL
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('here it is');
        print(data);
        convID = data;
        return data;
      } else {
        print('koi bhai');
        return -1;
      }
    } catch (error) {
      print('Error checking: $error');
      return -1;
      // Handle errors as needed
    }
  }

  Future<bool> checkConversations() async {
    int id = userDataManager.userId;
    final String receiver_name = widget.name;
    try {
      var url =
          '$BASE_URL/checkConvo.php?user_id=$id&receiver_name=$receiver_name';
      final response = await http.get(Uri.parse(url)); // Update the URL
      if (response.statusCode == 200) {
        // final data = json.decode(response.body);
        print('No need we have convo at home');
        return false;
      } else {
        print('Go create a Row of Convo');
        return true;
      }
    } catch (error) {
      print('Error checking: $error');
      return false;
      // Handle errors as needed
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
                  'Doctor Details',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 125,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image(
                              image: widget.image!.isNotEmpty
                                  ? (showImage(widget.image!) as Image).image
                                  : const AssetImage('default_image_path.png'),
                              height: 115,
                              width: 115,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                widget.name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.spec,
                                style: const TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: const Color(0xffD8FCEB),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xff38CC86),
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '4.7',
                                            style: TextStyle(
                                                color: Color(0xff38CC86),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 0, 5),
                    child: Text(
                      'About',
                      textAlign: TextAlign.start,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Text(
                      '${widget.name} completed her graduation from Sher-E Bangla Medical College in 1995. She dedicated her training in the field of Radiology and Imaging and accomplished ',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                    child: SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          DatePick(
                            date: '21',
                            day: 'Mon',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '23',
                            day: 'Tue',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '24',
                            day: 'Wed',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '25',
                            day: 'Thu',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '26',
                            day: 'Fri',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '28',
                            day: 'Sat',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '29',
                            day: 'Sun',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '1',
                            day: 'Mon',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '2',
                            day: 'Tue',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '3',
                            day: 'Wed',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '4',
                            day: 'Thu',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                          DatePick(
                            date: '5',
                            day: 'Fri',
                            onDateSelected: _handleDateSelected,
                            onSelected: _handleSelectedOnce,
                            select: select,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Wrap(children: [
                      Timepick(
                        time: '09.00 AM',
                        available: false,
                        onDateSelected: _handleTimeSelected,
                        onSelected: _handleSelectedOnce2,
                        select: select2,
                      ),
                      Timepick(
                        time: '10.00 AM',
                        available: true,
                        onDateSelected: _handleTimeSelected,
                        onSelected: _handleSelectedOnce2,
                        select: select2,
                      ),
                      Timepick(
                        time: '11.00 AM',
                        available: false,
                        onDateSelected: _handleTimeSelected,
                        onSelected: _handleSelectedOnce2,
                        select: select2,
                      ),
                      Timepick(
                        time: '12.00 AM',
                        available: false,
                        onDateSelected: _handleTimeSelected,
                        onSelected: _handleSelectedOnce2,
                        select: select2,
                      ),
                      Timepick(
                        time: '01.00 AM',
                        available: true,
                        onDateSelected: _handleTimeSelected,
                        onSelected: _handleSelectedOnce2,
                        select: select2,
                      ),
                      Timepick(
                        time: '02.00 AM',
                        available: true,
                        onDateSelected: _handleTimeSelected,
                        onSelected: _handleSelectedOnce2,
                        select: select2,
                      ),
                      Timepick(
                        time: '03.00 AM',
                        available: true,
                        onDateSelected: _handleTimeSelected,
                        onSelected: _handleSelectedOnce2,
                        select: select2,
                      ),
                      Timepick(
                        time: '03.00 AM',
                        available: true,
                        onDateSelected: _handleTimeSelected,
                        onSelected: _handleSelectedOnce2,
                        select: select2,
                      ),
                      Timepick(
                        time: '04.00 AM',
                        available: false,
                        onDateSelected: _handleTimeSelected,
                        onSelected: _handleSelectedOnce2,
                        select: select2,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffd4f7fc),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/msg');
                        },
                        child: const Icon(
                          CupertinoIcons.chat_bubble_text,
                          color: Color(0xff32c1e0),
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 7,
                  child: GestureDetector(
                    onTap: () async {
                      if (selectedDate.isNotEmpty && selectedTime.isNotEmpty) {
                        _scheduleDetails();
                        bool check = await checkConversations();
                        if (check) {
                          print('creating conv');
                          createConversations();
                          print(convID);

                          ///here i want to add something that will make the message icon highlighted
                        } else {
                          print('No need we have convo at home');
                        }
                        print(
                            "Selected date: $selectedDate\nSelected time: $selectedTime");
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Please Select Time and Date Properly');
                      }
                      selectedDate = '';
                      selectedTime = '';
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xff32c1e0),
                          borderRadius: BorderRadius.circular(32)),
                      child: const Center(
                        child: Text(
                          'Book Appointment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
