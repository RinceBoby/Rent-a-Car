import 'package:get_storage/get_storage.dart';

class GetLocalStorage {
  static final storage = GetStorage();

  //<<<<<Save_User_Details>>>>>//
  static saveToken(Map<String, String> user) {
    storage.write("uId", user['uId']);
    storage.write("token", user['token']);
  }

  //<<<<<Get_User_Details>>>>>//
  static String? getUserIdAndToken(String key) {
    String? user = storage.read<String?>(key);
    return user;
  }

  //<<<<<Remove_User_Details>>>>>//
  static removeUser(String key) {
    Future<void> user = storage.remove(key);
  }
}
