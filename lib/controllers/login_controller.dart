import 'package:carmarket/services/user/user_auth_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  var loginLoading = false.obs;

  Future userLogin(String email, String password) async {
    loginLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    var response =
        await UserAuthServices.loginUser(email: email, password: password);
    loginLoading.value = false;
    // Get.offAll(const BottomNavBar());
    return response;
  }
}