 import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart'as http;
 import 'package:mediaid1/Services/Api_Constants.dart';

import '../Model/AiModel.dart';
import '../Model/ChatModel.dart';

class API {
   static Future<List<AiModel>> getModels()async {
     try{
       var response = await http.get(Uri.parse("$BASE_URL_AI/models"),
       headers:  {'Authorization':'Bearer $API_KEY'},
       );
       Map jsonResponse = jsonDecode(response.body);
       if (jsonResponse['error'] != null) {
         // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
         throw HttpException(jsonResponse['error']["message"]);
       }
       // print("jsonResponse $jsonResponse");
       List temp = [];
       for (var value in jsonResponse["data"]) {
         temp.add(value);
         //log("temp ${value["id"]}");
       }
       return AiModel.modelsFromSnapshot(temp);
     } catch (error) {
       log("error $error");
       rethrow;
     }
   }
   static Future<List<ChatModel>> sendMessage({required String message})async {
   //   try{
   //     var response = await http.post(Uri.parse("$BASE_URL/completions"),
   //       headers: {
   //         'Authorization': 'Bearer $API_KEY',
   //         "Content-Type": "application/json"
   //       },
   //       body: jsonEncode(
   //         {
   //           "model": 'text-davinci-003',
   //           "prompt": message,
   //           "max_token":300,
   //         },
   //       ),
   //     );
   //     Map jsonResponse = json.decode(utf8.decode(response.bodyBytes));
   //     if (jsonResponse['error'] != null) {
   //       // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
   //       throw HttpException(jsonResponse['error']["message"]);
   //     }
   //     List<ChatModel> chatList = [];
   //     if (jsonResponse["choices"].length > 0) {
   //       //  log("jsonResponse[choices]text ${jsonResponse["choices"][0]["text"]}");
   //       chatList = List.generate(
   //         jsonResponse["choices"].length,
   //             (index) => ChatModel(
   //           msg: jsonResponse["choices"][index]["text"],
   //           chatIndex: 1,
   //         ),
   //       );
   //     }
   //     return chatList;
   //   } catch (error) {
   //     log("error $error");
   //     rethrow;
   //   }
   // }
     try{
       var response = await http.post(Uri.parse("$BASE_URL_AI/chat/completions"),
         headers: {
           'Authorization': 'Bearer $API_KEY',
           "Content-Type": "application/json"
         },
         body: jsonEncode(
           {
             "model": 'gpt-3.5-turbo',
             "messages": [
               {
                 "role": "user",
                 "content": message,
               }
             ]
           },
         ),
       );
       Map jsonResponse = json.decode(utf8.decode(response.bodyBytes));
       if (jsonResponse['error'] != null) {
         // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
         throw HttpException(jsonResponse['error']["message"]);
       }
       List<ChatModel> chatList = [];
       if (jsonResponse["choices"].length > 0) {
         //  log("jsonResponse[choices]text ${jsonResponse["choices"][0]["text"]}");
         chatList = List.generate(
           jsonResponse["choices"].length,
               (index) => ChatModel(
             msg: jsonResponse["choices"][index]["message"]["content"],
             chatIndex: 1,
           ),
         );
       }
       return chatList;
     } catch (error) {
       log("error $error");
       rethrow;
     }
   }}
