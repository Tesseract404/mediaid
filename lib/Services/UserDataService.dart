import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mediaid1/Model/userdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api_Constants.dart';

class UserDataService {
  Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('user_id') ?? -1;
    return id;
  }
  // Future<String?> fetchUserName(int userId) async {
  //   final url = Uri.parse('$BASE_URL/fetchdata.php?user_id=$userId');
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     return jsonData['name'];
  //   } else {
  //     throw Exception('Failed to fetch user data');
  //   }
  // }
  Future<userdata?> fetchUserData(int userId) async {
    final url = Uri.parse('$BASE_URL/fetchdata.php?user_id=$userId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return userdata(
        id: jsonData['user_id'],
        name: jsonData['name'],
        email: jsonData['email'],
        password: jsonData['password'],
      );
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
}