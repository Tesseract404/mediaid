import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:mediaid1/Model/msgModel.dart';
import 'package:mediaid1/Services/DoctorService.dart';
import 'package:mediaid1/Widgets/chatCard.dart';
import 'package:intl/intl.dart';
import '../Services/Api_Constants.dart';
import '../Services/UserDataManager.dart';
import '../Widgets/buttons/backbutton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
class Chats extends StatefulWidget {
  final String name;
  final int id;
  final bool user;
  const Chats({Key? key, required this.name, required this.id, required this.user}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<msgModel> _msgList = [];
  bool isLoading = true;
  String specify='';
  int userID =-1;
  int patientID= -1;
  int docId= -1;
  late String name = 'null';
  final userDataManager = UserDataManager();
  final doctorService = DoctorService();
  late TextEditingController _chatController;
  late ScrollController _listScrollController ;
  late Timer _timer;
  @override
  void initState() {
    print('is user${widget.user}');
    print('is user${widget.id}');
    fetchMessages();
    startTimer();
    _chatController = TextEditingController();
    userDataManager.initializeUserData().then((_) {
      setState(() {});
    });
    super.initState();
    _listScrollController = ScrollController();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        fetchMessages();
      }
    });
  }
  void setSpecify(String val){
    specify=val;
  }
  Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('user_id') ?? -1;
    return id;
  }
  Future<String?> fetchUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('user_id') ?? -1;
    if (userId == -1) {
      throw Exception('User ID not found in shared preferences');
    }
    final url = Uri.parse('$BASE_URL/fetchdata.php?user_id=$userId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['name'];
    } else {
      //throw Exception('Failed to fetch user data');
      print('Not a user!!');
      final url = Uri.parse('$BASE_URL/fetchdocdata.php?user_id=$userId');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData['name'];
      }else{
        throw Exception('Failed to fetch anything!');
      }
    }
  }
  // Future<String?> fetchUserName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var userId = prefs.getInt('user_id') ?? -1;
  //
  //   if (userId == -1) {
  //     throw Exception('User ID not found in shared preferences');
  //   }
  //
  //   final url = Uri.parse('$BASE_URL/fetchdata.php?user_id=$userId');
  //   final response = await http.get(url);
  //
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     return jsonData['name'];
  //   } else {
  //     throw Exception('Failed to fetch user data');
  //   }
  // }
  Future<void> fetchMessages() async{
    userID = await getUserId();
    name = (await fetchUserName())!;
    try {
      var url = '$BASE_URL/fetchChat.php?conv_id=${widget.id}&name=$name';
      //print('im here now');
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        //print('im here rn');
        final List<msgModel> fetchedData =
        List<msgModel>.from(data.map((item) {
          /// specifier fix
          // print('patient id is${item['user_id']}');
          // print('doc id is $userID');
          if( item['name']== name){
            setSpecify('1');
          }else{
            setSpecify('2');
            patientID=item['user_id'];
            // print(patientID);
            // print(userID);
            // print(specify);
          }
          /// specifier fix
          /// model ready
          return msgModel(
              content: item['content'],
              specifier: specify,
              time: DateTime.parse(item['time_stamp']),
          );
        }));
        setState(() {
          //print('im here now???');
          /// assigning
          _msgList = fetchedData;
          isLoading = false;
        });
      } else {
        print('im here theres nothing');
        isLoading = false;
      }
    } catch (error) {
      print('im here now with error');
      print('Error fetching data: $error');
      // Handle errors as needed
    }
  }
  Future<void> SendMessage()async {
    if(_chatController.text.isEmpty){
      return;
    }
    else{

        print('Yess user');
        docId= await doctorService.fetchDocId(widget.name);
        print('doc id is $docId');

      name = (await fetchUserName())!;
      print(name);
      final int user_id = userDataManager.userId;
      print(user_id);
      final int conv_id = widget.id;
      print(conv_id);
      final String content = _chatController.text;
      print(content);
      final msgData = msgModel(
        content: content,
        specifier: '1',
        time: DateTime.now(),
      );
      setState(() {
        _msgList.add(msgData);
        _chatController.clear();
         //print(_name.text);
      });
      try{
        var url = Uri.parse('$BASE_URL/sendchat.php');
        var response = await http.post(url,
            body: {
              "user_id": user_id.toString(),
              "conv_id": conv_id.toString(),
               "id": docId.toString(),
              "name": name,
              "content": content,
            });
        print('reached111');
        var data = json.decode(response.body);
        if(data == "success"){
          print(data);
        }
      }catch(e){
        print(e);
      }
      //print('reached Sendmsg 2');
      //SendMessage2();
    }
  }
  Future<void> SendMessageDoc()async {
    if(_chatController.text.isEmpty){
      return;
    }
    else{
      name = (await fetchUserName())!;
      print(name);
      print("patient is $patientID");
      final int user_id = userDataManager.userId;
      print(user_id);
      final int conv_id = widget.id;
      print(conv_id);
      final String content = _chatController.text;
      print(content);
      final msgData = msgModel(
        content: content,
        specifier: '1',
        time: DateTime.now(),
      );
      setState(() {
        _msgList.add(msgData);
        _chatController.clear();
        //print(_name.text);
      });
      try{
        var url = Uri.parse('$BASE_URL/sendchat.php');
        var response = await http.post(url,
            body: {
              'user_id': patientID.toString(),
              'conv_id': conv_id.toString(),
              'id': user_id.toString() ,
              'name': name,
              'content': content,
            });
        print('reached111');
        var data = json.decode(response.body);
        if(data == "success"){
          print(data);
        }
      }catch(e){
        print(e);
      }
      //print('reached Sendmsg 2');
      //SendMessage2();
    }
  }
  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.elasticOut
    );
  }
  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf7fc),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        leading: const backbutton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 21,
                    color: Colors.black),
              ),
            ),
            // const Icon(Icons.more_vert,color: Colors.black54,)
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///if not text found for the convo
            _msgList.isEmpty?Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(color: Colors.black12, width: 0.5)),
                child: Column(
                  children: const [
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        'Start Consultation',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0xff32c1e0),
                        ),
                      ),
                    ),
                    Text(
                      'Here you can consult your problems to the doctor directly',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ):
            Flexible(
              child:
              ListView.builder(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  controller: _listScrollController,
                  itemCount: _msgList.length,
                  itemBuilder: (context, index) {
                    final reversedIndex = _msgList.length - 1 - index;
                    final msg = _msgList[reversedIndex];
                    final formattedTime = DateFormat.jm().format(msg.time);

                    // Check if the message was sent today, and if not, show the date
                    final now = DateTime.now();
                    final isToday = now.year == msg.time.year &&
                        now.month == msg.time.month &&
                        now.day == msg.time.day;
                    final displayTime = isToday ? formattedTime : DateFormat.yMd().format(msg.time);

                    return chatCard(
                      content: msg.content,
                      specifier: msg.specifier,
                      time: displayTime,
                    );
                  }),

            ),
            ///if not text found for the convo///////////////////////////////

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1.0,
                        spreadRadius: 0.2,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:   [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                        child: Center(
                          child: TextField(
                            controller: _chatController,
                            decoration: const InputDecoration(
                              hintText: 'Type message...',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              // focusColor: Colors.transparent,
                              // focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                            cursorColor: Colors.black45,
                            cursorHeight: 25,
                            cursorWidth: 1,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    //   child: Icon(Icons.attachment_rounded,color: Color(0xff32c1e0),),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: IconButton(
                          color: const Color(0xff32c1e0),
                          onPressed: () async{
                             widget.user? await SendMessage(): await SendMessageDoc();
                          setState(() {
                          });
                            },
                          icon: const Icon(Icons.send)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}