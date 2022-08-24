import 'package:carmarket/models/signup/profile_model.dart';
import 'package:carmarket/services/user/user_profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel?> profileModel = ProfileModel().obs;

  @override
  void onInit() {
    UserProfileService.getUserProfileData().then(
      (value) {
        return profileModel.value = value;
      },
    );
    super.onInit();
  }
}
