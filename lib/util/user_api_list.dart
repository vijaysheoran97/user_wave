import 'package:user_wave/user/model/user_information_model.dart';

class UserResponseList {
  List<UserInformation> details = [];
  UserResponseList({required this.details});

  factory UserResponseList.fromJson(List<dynamic> json) {
    List<UserInformation> productList = [];
    for (var productJson in json) {
      productList.add(UserInformation.fromJson(productJson));
    }
    return UserResponseList(details: productList);
  }
}