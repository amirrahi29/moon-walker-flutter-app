import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/model/AuthenticationModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {

  static var client = http.Client();

  static Future<dynamic> sendOTPRepo(String phoneNumber) async {
    try {
      AuthenticationModel authenticationModel = AuthenticationModel();
      authenticationModel.request_with = Config.sendOTPRequest;
      authenticationModel.phone = phoneNumber;
      var response = await client.post(
          Uri.parse(Config.baseUrl + Config.sendOtp),
          body: authenticationModel.toMap(),
          headers: Config.wihoutTokenHeader);
      var convertedJson = jsonDecode(response.body);
      //logs start
      GlobalEquipments.MyLogs(convertedJson.toString());
      //logs end
      if (convertedJson['success'] == true) {
        GlobalEquipments.SnackToastSuccess("Login", convertedJson['message']);
        return convertedJson['success'];
      } else {
        GlobalEquipments.SnackToastFailed("Login", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Login", e.toString());
      return false;
    }
  }

  static Future<dynamic> reSendOTPRepo(String phoneNumber) async {
    try {
      AuthenticationModel authenticationModel = AuthenticationModel();
      authenticationModel.request_with = Config.reSendOTPRequest;
      authenticationModel.phone = phoneNumber;

      var response = await client.post(
          Uri.parse(Config.baseUrl + Config.resendOtp),
          body: authenticationModel.toMap(),
          headers: Config.wihoutTokenHeader);
      var convertedJson = jsonDecode(response.body);
      //logs start
      GlobalEquipments.MyLogs(convertedJson.toString());
      //logs end
      if (convertedJson['success'] == true) {
        GlobalEquipments.SnackToastSuccess(
            "Resend OTP", convertedJson['message']);
        return convertedJson['success'];
      } else {
        GlobalEquipments.SnackToastFailed(
            "Resend OTP", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Resend OTP", e.toString());
      return false;
    }
  }

  static Future<dynamic> verifyOTPRepo(String phoneNumber, String otp) async {
    try {
      AuthenticationModelOTP authenticationModel = AuthenticationModelOTP();
      authenticationModel.request_with = Config.verifyOTPRequest;
      authenticationModel.phone = phoneNumber;
      authenticationModel.otp = otp;

      var response = await client.post(
          Uri.parse(Config.baseUrl + Config.verifyOtp),
          body: authenticationModel.toMap(),
          headers: Config.wihoutTokenHeader);
      var convertedJson = jsonDecode(response.body);
      //logs start
      GlobalEquipments.MyLogs(convertedJson.toString());
      //logs end
      if (convertedJson['success'] == true) {
        GlobalEquipments.SnackToastSuccess("Welcome", convertedJson['message']);
        //save token start
        Singelton.saveToken(
            convertedJson['data']['token'],
            convertedJson['data']['user']['id'].toString(),
        );
        GlobalEquipments.MyLogs("AuthToken: ${convertedJson['data']['token']}");
        GlobalEquipments.MyLogs("user id: ${convertedJson['data']['user']['id']}");
        //save token end
        return convertedJson['success'];
      } else {
        GlobalEquipments.SnackToastFailed(
            "Verify OTP", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Verify OTP", e.toString());
      return false;
    }
  }

  static Future<dynamic> logoutRepo() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end

      var response = await client.post(Uri.parse(Config.baseUrl + Config.logout),
          headers: {
          'Accept': 'application/json',
          'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      print(myToken);
      //logs start
      GlobalEquipments.MyLogs(convertedJson.toString());
      //logs end
      if (convertedJson['success'] == true) {
        GlobalEquipments.SnackToastSuccess(
            "oops!", convertedJson['message']);
        return convertedJson['success'];
      } else {
        GlobalEquipments.SnackToastFailed(
            "SignOut", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("SignOut", e.toString());
      return false;
    }
  }

}
