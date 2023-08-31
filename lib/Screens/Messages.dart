import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mediaid1/Model/ConvoData.dart';
import '../Model/userdata.dart';
import '../Services/Api_Constants.dart';
import '../Services/UserDataManager.dart';
import '../Widgets/ChatHeads.dart';
import '../Widgets/buttons/UnionpopButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../Services/UserDataService.dart';
class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  bool user = true;
  int userId = -1;
  late String name = 'null';
  String isname= '';
  String email = ' ';
  userdata? userData;
  final userDataService = UserDataService();
  List<ConvoData> _convoList = [];
  bool isLoading = true;
  @override
  void initState()   {
    super.initState();
    // userDataService.getUserId().then((id) {
    //   setState(() {
    //     userId = id;
    //     print(userId);
    //     print(name);
    //   });
    //   if (userId != -1) {
    //     userDataService.fetchUserData(userId).then((data) {
    //       if (data != null) {
    //         setState(() {
    //           userData = data;
    //           name = data.name;
    //           email = data.email;
    //         });
    //       }
    //     });
    //   }
    // });
    print('im here!!!!!!');
    print(name);

     printId();
    //
    // print('im here');
    // print(userId);
    print('im here name exists???');
  }
  Future<void> printId() async {
    // userId = await getUserId();
    // print('id is $userId');
    isname= (await fetchUserName())!;
    print('name is $isname');
    if(user){
      fetchConversations();
    }else
    {
      fetchConversationsDoc();
    }
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
        setState(() {
          user= false;
          print(user);
        });
        return jsonData['name'];
      }else{
        throw Exception('Failed to fetch anything!');
      }
    }
  }
  //  void getUserName()   {
  //   if(userId!=-1){
  //     userDataService.fetchUserData(userId).then((data) {
  //       if (data != null) {
  //         name = data.name;
  //         print(name);
  //       }
  //     });
  //   }
  // }

  Future<void> fetchConversations() async {
    userId = await getUserId();
    name =  (await fetchUserName())! ;///////////////////////////////////////////
    //print(name);
    print('im here hi');
    try {
      var url = '$BASE_URL/fetchConvo.php?name=$name';
      print('im here now');
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('im here rn');
        final List<ConvoData> fetchedData =
            List<ConvoData>.from(data.map((item) {
          /// time process
          final DateTime timestamp = DateTime.parse(item['time_stamp']);
          final DateTime now = DateTime.now();
          final bool isSameDay = timestamp.year == now.year &&
              timestamp.month == now.month &&
              timestamp.day == now.day;

          final formattedTimeOrDate = isSameDay
              ? DateFormat.jm().format(timestamp) // Adds AM/PM to the time
              : '${timestamp.year}-${timestamp.month.toString().padLeft(2, '0')}-${timestamp.day.toString().padLeft(2, '0')}';

          String base64Image = item['image'];
          if(base64Image!=''){
            Base64Codec base64 = const Base64Codec();
            base64Image = base64.normalize(base64Image);
            if (base64Image.startsWith("data:")) {
              final commaIndex = base64Image.indexOf(",");
              if (commaIndex != -1) {
                base64Image = base64Image.substring(commaIndex + 1);
              }
            }
          }
          String rname =item['receiver_name'];
          print(name);
          if(rname == name){
            rname=item['name'];
            ///image process
            print('image processing');
            base64Image = DEFAULT_IMG;
          }else{
            ///image process
             print('image processing in else');
             print(rname);

          }
          return ConvoData(
            id: item['conv_id'],
            docName: rname,
            image: base64Image,
            time: formattedTimeOrDate,

          );
        }));

        setState(() {
          print('im here now???');
          _convoList = fetchedData;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          //print('heres the data:  ');
          print('im here theres nothing');
        });
      }
    } catch (error) {
      print('im here now with error');
      print('Error fetching data: $error');
      // Handle errors as needed
    }
  }
  Future<void> fetchConversationsDoc() async {

    print('im here hi for doctor');
    try {
      print('im here hi for doctor name is $isname');
      var url = '$BASE_URL/fetchConvoDoc.php?receiver_name=$isname';
      print('im here now');
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('im here rn');
        final List<ConvoData> fetchedData =
        List<ConvoData>.from(data.map((item) {
          /// time process
          final DateTime timestamp = DateTime.parse(item['time_stamp']);
          final DateTime now = DateTime.now();
          final bool isSameDay = timestamp.year == now.year &&
              timestamp.month == now.month &&
              timestamp.day == now.day;

          final formattedTimeOrDate = isSameDay
              ? DateFormat.jm().format(timestamp) // Adds AM/PM to the time
              : '${timestamp.year}-${timestamp.month.toString().padLeft(2, '0')}-${timestamp.day.toString().padLeft(2, '0')}';

          String base64Image = item['image'];
          if(base64Image!=''){
            Base64Codec base64 = const Base64Codec();
            base64Image = base64.normalize(base64Image);
            if (base64Image.startsWith("data:")) {
              final commaIndex = base64Image.indexOf(",");
              if (commaIndex != -1) {
                base64Image = base64Image.substring(commaIndex + 1);
              }
            }
          }
          String rname =item['name'];
          return ConvoData(
            id: item['conv_id'],
            docName: rname,
            image: base64Image,
            time: formattedTimeOrDate,

          );
        }));

        setState(() {
          print('im here now???');
          _convoList = fetchedData;
          isLoading = false;
        });
      } else {
        setState(() {
          //final data = json.decode(response.body);
          isLoading = false;
          print('im here theres nothing ');
        });
      }
    } catch (error) {
      print('im here now with error');
      print('Error fetching data: $error');
      // Handle errors as needed
    }
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Messages',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              ),
            ),
            // Icon(CupertinoIcons.search,
            //   color: Colors.black87,size: 26,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_convoList.isNotEmpty)
              Column(
                children: [
                  for (int index = 0; index < _convoList.length; index++)
                    ChatHeads(
                      id: _convoList[index].id,
                      name: _convoList[index].docName,
                      image: user?_convoList[index].image:'',
                      time: _convoList[index].time,
                      lasttxt: 'Nothing for now!',
                      user: user,
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
                      'Add Schedule with any doctors to chat with them directly',
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
    );
  }
}
