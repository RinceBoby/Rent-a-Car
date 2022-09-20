import 'package:get/get.dart';

class SignupController extends GetxController {
  String? ageSelectedValue;
  String? genderSelectedValue;
  String? districtSelectedValue;
  

  List<int> ageItems = List.generate(20, (index) => 18 + index);
  List<String> genderItems = ['Male', 'Female'];
  List<String> districtItems = [
    'Kasargod',
    'Kannur',
    'Wayanad',
    'Kozhikode',
    'Malapuram',
    'Palakkad',
    'Thrissur',
    'Ernakulam',
    'Idukki',
    'Kottayam',
    'Alapuzha',
    // 'Pathanamthitta',
    'Kollam',
    'Trivandrum',
  ];

  dropdownValueChanging(String value, String checkingValue) {
    if (checkingValue == "age") {
      ageSelectedValue = value;
    } else if (checkingValue == "gender") {
      genderSelectedValue = value;
    } else if (checkingValue == "district") {
      districtSelectedValue = value;
    }
    update();
  }
}
