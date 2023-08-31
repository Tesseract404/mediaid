import '../Model/userdata.dart';
import 'UserDataService.dart';

class UserDataManager {
  int userId = -1;
  String name = ' ';
  String email = ' ';
  userdata? userData;
  final userDataService = UserDataService();

  Future<void> initializeUserData() async {
    userId = await userDataService.getUserId();

    if (userId != -1) {
      final data = await userDataService.fetchUserData(userId);
      if (data != null) {
        userData = data;
        name = data.name;
        email = data.email;
      }
    }
  }
}