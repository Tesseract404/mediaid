import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mediaid1/Model/doctorModel.dart';

import 'Api_Constants.dart';
import 'DoctorList.dart';

class DoctorService {
  Future<int> fetchDocId(String name) async {
    print('im in Serivice');
    final url = Uri.parse('$BASE_URL/fetchdoctorId.php?name=$name');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return int.parse(jsonData);
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
  Future<void> fetchDoctorIdAndPrint(String doctorName) async {
    try {
      final doctorId = await fetchDocId(doctorName);
      print(doctorId);
    } catch (e) {
      print('Error: $e');
    }
  }
  static Future<List<doctorModel>?> fetchDoctors() async {
    try{
      final response = await http.get(Uri.parse('$BASE_URL/fetchdoctors.php'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) ;
        final List<doctorModel> fetchedData = List<doctorModel>.from(
          data.map(
                (item) {
              String base64Image = item['image'];
              Base64Codec base64 = const Base64Codec();
              base64Image = base64.normalize(base64Image);
              if (base64Image.startsWith("data:")) {
                final commaIndex = base64Image.indexOf(",");
                if (commaIndex != -1) {
                  base64Image = base64Image.substring(commaIndex + 1);
                }
              }
              return doctorModel(
                title: item['name'],
                email: item['email'],
                category: item['spec'],
                image: base64Image,
                password:'****',
                id: item['id'],
                  // Store decoded image bytes
              );
            },
          ),
        ).toList();
        DoctorList().addDoctor(fetchedData);
      } else {
        throw Exception('Failed to load data');
      }
    }catch(e){
      print('Error fetching data: $e');
    }
  }
}