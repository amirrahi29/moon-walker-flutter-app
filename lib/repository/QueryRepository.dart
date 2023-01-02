import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';

class QueryRepository{

  static var client = http.Client();

  static Future<dynamic> submitQueryForm(String message) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.post(
          Uri.parse(Config.baseUrl + Config.enquiries),
          body: {
            'message':message
          },
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        GlobalEquipments.SnackToastSuccess("Help Center", convertedJson['message']);
        return convertedJson['success'];
      } else {
        GlobalEquipments.SnackToastFailed("Help Center", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Distributor", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return false;
    }
  }

}