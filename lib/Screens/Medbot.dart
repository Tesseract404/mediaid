import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mediaid1/Model/testTextmodel.dart';
import 'package:mediaid1/Services/ChatProvider.dart';
import 'package:mediaid1/Widgets/buttons/UnionpopButton.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediaid1/Widgets/aichatCard.dart';
import 'package:provider/provider.dart';
import '../Model/ChatModel.dart';
import '../Services/API.dart';

class Medbot extends StatefulWidget {
  const Medbot({Key? key}) : super(key: key);

  @override
  State<Medbot> createState() => _MedbotState();
}

class _MedbotState extends State<Medbot> {
  bool _isTyping = false;
  late TextEditingController _text = TextEditingController();
  late ScrollController _listScrollController = ScrollController();
  late FocusNode focusNode;
  @override
  void initState() {
    _text = TextEditingController();
    _listScrollController =ScrollController();
    focusNode = FocusNode();
    super.initState();
  }

  void dispose() {
    _text = TextEditingController();
    _listScrollController =ScrollController();
    super.dispose();
  }

  List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context) ;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: const UnionpopButton(),
        centerTitle: true,
        title: Row(
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text(
                  'MedBot Ai',
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            chatProvider.getChatList.isEmpty?
            Column(
              children:const [
                Center(
                  child: Image(
                    image: AssetImage(
                        'assets/bot.png'
                    ),height: 180,width: 180,
                  ),
                ),
                Text(
                  'MedBot Ai'  ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 31,
                    color: Color(0xff32c1e0),
                  ),
                ),
              ],
            ) :Flexible(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _listScrollController,
                  itemCount: chatProvider.getChatList.length,
                  itemBuilder: (context, index) {
                    return aichatCard(
                        msg: chatProvider
                            .getChatList[index].msg, // chatList[index].msg,
                        chatIndex: chatProvider.getChatList[index]
                            .chatIndex, shouldAnimate:
                        chatProvider.getChatList.length - 1 == index, );
                  }),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.black26,
                size: 22,
              )
            ],

            /// Text field for user input ////
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
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(19, 0, 0, 0),
                        child: Center(
                          child: TextField(
                            focusNode: focusNode,
                            onSubmitted: (value)
                              async{
                                await sendMessageFCT(chatProvider: chatProvider);
                              },
                            controller: _text,
                            decoration: const InputDecoration(
                              hintText: 'How can I help you today...',
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
                    IconButton(
                        color: Color(0xff32c1e0),
                        onPressed: () async{
                          await sendMessageFCT(chatProvider: chatProvider);
                        },
                        icon: Icon(Icons.send)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut);
  }
  Future<void> sendMessageFCT({required ChatProvider chatProvider}) async {
    if(_isTyping){
      return;
    }
    if(_text.text.isEmpty){
      return;
    }
    try {
      String msg =_text.text;
     // log('Request has been sent');
      setState(() {
        _isTyping = true;
        //chatList.add(ChatModel(msg: _text.text, chatIndex: 0));
        chatProvider.addUserMessage(msg: msg);
        _text.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(msg: msg);
      //chatList.addAll(await API.sendMessage(message: _text.text));
      setState(() {

      });
    } catch (error) {
      print('$error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text  (
          error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
    ;
  }
}
