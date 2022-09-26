// ignore_for_file: unused_local_variable

import 'package:get_storage/get_storage.dart';

class GetLocalStorage {
  
  static final storage = GetStorage();

  //<<<<<Save_User_Details>>>>>//
  static saveToken(Map<String, String> user) {
    storage.write("uId", user['uId']);
    storage.write("token", user['token']);
    storage.write('name', user['name']);
    storage.write('email', user['email']);
  }

  //<<<<<Get_User_Details>>>>>//
  static String? getUserIdAndToken(String key) {
    String? user = storage.read<String?>(key);
    return user;
  }

  //<<<<<Remove_User_Details>>>>>//
  static removeUserTokenAndUid() {
    storage.remove("uId");
    storage.remove("token");
    storage.remove('name');
    storage.remove('email');
  }
}
