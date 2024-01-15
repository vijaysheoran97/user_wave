import 'package:flutter/cupertino.dart';
import 'package:user_wave/user/model/user_information_model.dart';
import 'package:user_wave/user/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  List<UserInformation> userInformation = [];

  addData() async {
    try {
      userInformation = await UserApiService.getUserInfo();
      notifyListeners();
    } catch (error) {
      print('Error fetching user information: $error');
    }
  }
}
