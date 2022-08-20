import 'package:get_storage/get_storage.dart';

class GetLocalStorage {
  static final storage = GetStorage();

  static saveToken(Map<String, String> user) {
    storage.write("uId", user['uId']);
    storage.write("token", user['token']);
  }

  static String? getUserIdAndToken(String key) {
    String? user = storage.read<String?>(key);
    return user;
  }
}
