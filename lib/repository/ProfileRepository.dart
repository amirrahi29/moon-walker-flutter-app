import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/model/UserModel.dart';

class ProfileRepository{

  static var client = http.Client();

  static Future<dynamic> getProfile() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end

      var response = await client.get(
          Uri.parse(Config.baseUrl + Config.updateProfile),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      //logs start
      GlobalEquipments.MyLogs(convertedJson.toString());
      //logs end
      if (convertedJson['success'] == true) {
        return convertedJson['data']['user'];
      } else {
        GlobalEquipments.SnackToastFailed("Profile", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Profile", e.toString());
      return false;
    }
  }

  static Future<dynamic> updateProfile(String name, String email, String phone) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end

      UserModel userModel = UserModel();
      userModel.name = name;
      userModel.email = email;
      userModel.phone = phone;

      var response = await client.post(
          Uri.parse(Config.baseUrl + Config.updateProfile),
          body: userModel.toMap(),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      //logs start
      GlobalEquipments.MyLogs(convertedJson.toString());
      //logs end
      if (convertedJson['success'] == true) {
        GlobalEquipments.SnackToastSuccess("Profile", convertedJson['message']);
        return convertedJson['success'];
      } else {
        GlobalEquipments.SnackToastFailed("Profile", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Profile", e.toString());
      return false;
    }
  }

}