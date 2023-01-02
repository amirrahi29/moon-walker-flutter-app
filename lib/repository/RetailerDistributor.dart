import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/model/CategoryModel.dart';
import 'package:moon_walker/model/CollectionModel.dart';
import 'package:moon_walker/model/RetailerDistributorModel.dart';
import 'package:moon_walker/model/SlidersModel.dart';

class RetailerDistributorRepo{

  static var client = http.Client();

  static Future<dynamic> getDistributorsRepo() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse(Config.baseUrl + Config.distributors),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return (convertedJson['data']['data'] as List).map((e) => RetailerDistributorModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Distributor", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> getRetailerRepo() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse(Config.baseUrl + Config.retailers),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return (convertedJson['data']['data'] as List).map((e) => RetailerDistributorModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Retailer", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

}