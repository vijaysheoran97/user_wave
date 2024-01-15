import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_wave/user/model/user_information_model.dart';
import 'package:user_wave/util/api_endpoint.dart';
import 'package:user_wave/util/user_api_list.dart';

class UserApiService{
  static Future<List<UserInformation>> getUserInfo() async {
    String url = ApiEndPoint.baseUrl;
    http.Response response = await http.get(
      Uri.parse(url),

    );
    if (response.statusCode == 200) {
      String body = response.body;
      final data = jsonDecode(body);

      UserResponseList userInformation= UserResponseList.fromJson(data);
      return userInformation.details;
    } else {
      throw 'Something went wrong';
    }
  }
}

